def english_number number
  if number < 0
    return 'Please enter a number that isn\'t negative'
  elsif number == 0
    return 'zero'
  end

  num_string = ''

  ones_place = ['one', 'two', 'three',
                'four', 'five', 'six',
                'seven', 'eight', 'nine']
  tens_place = ['ten', 'twenty', 'thirty',
                'forty', 'fifty', 'sixty',
                'seventy', 'eighty', 'ninety']
  teenagers  = ['eleven', 'twelve', 'thirteen',
                'fourteen', 'fifteen', 'sixteen',
                'seventeen', 'eighteen', 'nineteen']
  big_nums   = [['hundred', 2], ['thousand', 3], ['million', 6], ['billion', 9], ['trillion', 12],
                ['quadrillion', 15], ['quintillion', 18], ['sextillion', 21],
                ['septillion', 24], ['octillion', 27], ['nonillion', 30],
                ['decillion', 33], ['undecillion', 36], ['duodecillion', 39],
                ['tredecillion', 42], ['quattuordecillion', 45], ['quindecillion', 48]]

  left = number

  while big_nums.length > 0
    big_num = big_nums.pop
    big_name = big_num[0]
    big_base = 10 ** big_num[1]
    write = left / big_base
    left = left - write * big_base

    if write > 0
      prefix = english_number write
      num_string = num_string + prefix + ' ' + big_name

      if left > 0
        num_string = num_string + ' '
      end
    end
  end

  write = left/10
  left = left - write*10

  if write > 0
    if ((write == 1) and (left > 0))
      num_string = num_string + teenagers[left - 1]
      left = 0
    else
      num_string = num_string + tens_place[write - 1]
    end

    if left > 0
      num_string = num_string + '-'
    end
  end

  write = left
  left = 0

  if write > 0
    num_string = num_string + ones_place[write - 1]
  end

  num_string

end
