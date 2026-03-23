Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFABFC72C5
	for <ath12k@archiver.kernel.org>; Mon, 23 Mar 2026 12:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7W4tXDWS7eU/qHOIUTM+5yUH7PgzBQxpVMleROeekeE=; b=TBzifuim0gujKJlGAItd4rvcSl
	L43OXJVpv7Mpd5YB9dIqecYunpnkxxHopp9Rqo0kU+PfyAzJb6aiq5aduSNNgkryJNNAPuEusD2aK
	LgrZrI4S5f68RsxE/sCjwbRM3UXkAUuj0w5KAepv44echnkFjDqgnWqHq5BRnNKMwAGs1fIywIn/I
	dsq0SIfqAk6uRkU2EXLJT0NF0Aek9oFbGMmgW72vUILFlkVv7XcKpwHy32HM5kMpG5ms/2x+Wf1SD
	yKqT2yEneAcj0kCXYMj86RaT6EcdebR85+6QStObo01ltEPQ+kS+xCt10sJlyJp2fiBOmM39uoPgz
	TMhFzstw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ean-0000000GiCA-48ui;
	Mon, 23 Mar 2026 12:41:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4eal-0000000GiBu-3OGq
	for ath12k@bombadil.infradead.org;
	Mon, 23 Mar 2026 12:41:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7W4tXDWS7eU/qHOIUTM+5yUH7PgzBQxpVMleROeekeE=; b=gtiQWUikOt9Pds2ZqDapKYsibW
	VUwMNArLMJWOHCwdE95mzTNR6rEtMX7V3Vbcp/m0O5k0uEKM9WOj0nCH5G9TRaLYZvC0KV8Vg/N/x
	pK38KNQglhmRk53WoJz1XgdoDnwHbE2LG1JECc6Gc3CVksyV+w10wz4QKjCXXAFEWtJYP9WfGxqfZ
	VPKINOQkMTJ8VEqyEq5cg1e3YhbIms5aC6NYrPecP1DboqBt9kISib2KT2KZ/u1prwwNrz3l0buxf
	DlQdD8TsvfSA+0qBJ5Yy3iyrG2ShCIX0b0m+83QeGgrnbIXB8/HOcAU1+RJg0ha3olkmp4pNryxj5
	wLGz4mpw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4eai-00000001VRY-11Bj
	for ath12k@lists.infradead.org;
	Mon, 23 Mar 2026 12:41:10 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NBM0hP2758842
	for <ath12k@lists.infradead.org>; Mon, 23 Mar 2026 12:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7W4tXDWS7eU/qHOIUTM+5yUH7PgzBQxpVMleROeekeE=; b=AFLjDSCsJG10XCnK
	N8bXXBhNfPnKestPSnL/ZcICI2FtPu5/G7t/Hpdj+/qbZWw0tskf8pnurfu9Yvke
	tEdzX7G5TICO1vIEaAZOlFJQGEUHALaNe4zkQGUHUygfAztkWkNdOaXXlocbp2LI
	jJqnBT3de49tYeem7bJYrpy4QOgKLOxebm5Z4kEQ3cbPbKTZquGHer0YB33iM0Jc
	NSYgmzGOi06VAQ216YSeIpeaVUgr8S8qu7SBNzpNV7silU6BiYsIS5T4zO9e9WBa
	wlvhTnTMahvTvSCLAsjdwn/wa+Qfs0Avl9JBvae4kxt6TGvhEv0uStCKZ1I2vzEX
	3npeNQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4g7wp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Mar 2026 12:41:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a820305c1so91646b3a.0
        for <ath12k@lists.infradead.org>; Mon, 23 Mar 2026 05:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774269664; x=1774874464; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7W4tXDWS7eU/qHOIUTM+5yUH7PgzBQxpVMleROeekeE=;
        b=Qup3t64W77zxGUl2o90ddTXnXxvyWo4r+0Ow8+d0h7t4/F8XJB/j/+0V4kR4ZxKLfD
         L2QFDNKoFGpNluQz5e8bbvaNJjHIv0KtCZI8mn6axWKVzsPbrZa99OkIle282m/FkS9A
         cTbi21qUUtd1FHE0lDR5ff5Us6JEAtzq2xY5SqHcdoRcg1oYEl74v7lne7A4JD7EqFsB
         wFxXvrHLnsYAKP10UhUUJ5xQkCEqCxdunFXzdD8KymVnoVwid9Z/2Nl7643YUfCljAsZ
         +uvW6FZ0tBTGhc2PYclX2MvW2YOoug/E4VBUcqVo7/0r26xVFmRsn381pDDZzS/UdP/D
         LZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774269664; x=1774874464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7W4tXDWS7eU/qHOIUTM+5yUH7PgzBQxpVMleROeekeE=;
        b=AUA4/SpsSANYh5a9HFyPYVttPpr+JGom+KLVd1ue2o9DbRVCzd/tvaQE/SnWWaHmbq
         sXQ8T65loHcn/wko+94ia6jJLgqp2m8BN44GEcWwAGDGtpzV+TWZZlGbkj8N5rQsHUlT
         3Z/lKOGmlzExNcTexDysSwcaLgbsEnHFZ4Sh6xdwQ+M1sewUAqxADaWbQKaMlHKIEqzN
         ouzHWE+fIf6gtd2TGqNxU74mwZFcpdOyK1xvEae3+IruihUWU7UQsfwbJFbtnibnaG7S
         eFd/TlvMIXFpQqvf5Cl4yaA+/K2OYXtyeLU72eaSDsC9brKeGo8STc84dt+xfb7BoWRL
         pLXg==
X-Forwarded-Encrypted: i=1; AJvYcCUYGy0mnbdtfrZW+BkQAWMnCSW/M8lXfKi0njNS+4XH/RN9b1jez79lxJ+6liYXH484QepbwTs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxDFdb45q/JXGdPr3ORrVas27HCfmLeLUrPKHvYlHS3JTVIxHRT
	g+8LIgMdLdDRp168RZZt2gXCeNW21UzwSf0/vhjGdiW1uyjy4QuzW8MrNI0AtSHMyLVximVTVOT
	FwILl+ywpchH9fODNuL3RJocCic8aFKTZEEPNWhUeWlld2AJ0VsflXjIs4zZ8NWkm
X-Gm-Gg: ATEYQzzf0g0YR1NwsKzITnReAb+Lf8efFdov0lo5XT9yzhTcKetpPHvzDv4Yi6cqc/u
	PWUqZGEuWqyeWU88OQJeryKp3zZzu3C6MZD7FNsu4k1d4OB2UyFkiyGVHcN46M0A1bJ/bop3Uwe
	yb9vaJOD15Hxevg2/WMIkl7roNsgnuXVTM1vawDPqCoqbFS3LDwaXtSHX5OFErR2c+MmJGVpl+g
	0Q3Jice/BlHVggeDFbqE40Y9jSvjiwcIK0UZzicUtxIpU/3eTkwPT2mYLVNzzMvWeWPckA9X4j+
	EiAPTaCP871l/wSxlDrcZY4LnFRoIpoweG9x5lAf1Mr/vUFTe8xj8rkq1czkG7nsTmh/wSFYIs7
	2Xe5B9rkLrar65i8tmJ0+12Xz/ItglGypfWBE7Tf6X9aQ3Bm7yeX10X4VEuOpNWJu4A==
X-Received: by 2002:a05:6a00:2d96:b0:81f:40e5:34c2 with SMTP id d2e1a72fcca58-82a8c3469f6mr9661674b3a.32.1774269663747;
        Mon, 23 Mar 2026 05:41:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d96:b0:81f:40e5:34c2 with SMTP id d2e1a72fcca58-82a8c3469f6mr9661649b3a.32.1774269663209;
        Mon, 23 Mar 2026 05:41:03 -0700 (PDT)
Received: from [192.168.11.101] ([124.123.81.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bbf0c2sm10946997b3a.15.2026.03.23.05.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:41:02 -0700 (PDT)
Message-ID: <ec266bec-c371-4ec8-a60f-21ebb810d38e@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 18:10:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4] wifi: ath12k: avoid dynamic alloc when
 parsing wmi tb
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260317084740.3756880-1-nico.escande@gmail.com>
 <36c1cae8-d6c0-4432-bc8e-57216c5ea3fd@oss.qualcomm.com>
 <DH6U1JMUQXVM.287BFERLLK9KK@gmail.com>
 <40756be1-6a9a-4821-8c90-34f37db01e8b@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <40756be1-6a9a-4821-8c90-34f37db01e8b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: m6L7bVB06TUcbgl5WsQGTqdQtr7n24xb
X-Proofpoint-ORIG-GUID: m6L7bVB06TUcbgl5WsQGTqdQtr7n24xb
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c134e0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=R7zuFBDiW8lgADV909h7jA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=o7wDkDyKmALEIcUQXCkA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5OCBTYWx0ZWRfX3oDH5dEHEMeD
 RAEZxoc7d0WV9AIn2VN3BRGHomf8k7SAeI1GJan+2KSPLxSCvr8ndMNcUNqQHAmv6pjH980tGuH
 97JVlT8ZW4nd6VPuYyGVLD2xqIdEqztYpmuyb/t6yn//Wm+SMrjUgRHCMKhl5OI6PGSj1iNy9zR
 lxRxy5ogKGH1lfAw8OoYx+K+RdARJ8vI8Ohm4YR0wQeAvBeXaDWWSe4mtBPzp3yZKBEc1zML1CB
 l3UTCx6m2p7H64MD7LIEduoZH5Zwi2y9bkMnXgmD02dSuXzujn/WuhCJ2gwCNnBVJ8gRtbkA3KN
 w5KbyPNpObqbKCUbnW+tTuUkLh+BSFr1GJut3Igj5Vvkm5t91YIlxjRU2KhxKWNNdcAUpVwxAvw
 lIVt1ZiX2p8Jw+rgfMZYRCKS81YohwmoyJsAXSlOPs5wtgQGLi0gZiqvQ+Y+NMnZuOc+57WoMrl
 QNoW6H1rHTmJsuBerww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_124108_872681_5828C5C9 
X-CRM114-Status: GOOD (  27.68  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org



On 3/19/2026 9:29 PM, Jeff Johnson wrote:
> On 3/19/2026 7:35 AM, Nicolas Escande wrote:
>> On Thu Mar 19, 2026 at 12:08 PM CET, Rameshkumar Sundaram wrote:
>>>
>>> Since CONFIG_ATH12K is tristate, a built-in boot can continue past a
>>> failed ath12k_init() and still run ath12k_wifi7_init().
>>>
>> I genuinely thought the kernel prevented this. I was wrong.
>>
>>> Please ensure that later initialization path is guarded against
>>> allocation failure.
>>>
>> I can add a flag like so to be able to check from ath12k_wifi7_init() if the
>> init finished ok. Something in the lines of
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
>> index 6c034071cc6d..742fb33f41ff 100644
>> --- a/drivers/net/wireless/ath/ath12k/core.c
>> +++ b/drivers/net/wireless/ath/ath12k/core.c
>> @@ -34,6 +34,9 @@ module_param_named(ftm_mode, ath12k_ftm_mode, bool, 0444);
>>   MODULE_PARM_DESC(ftm_mode, "Boots up in factory test mode");
>>   EXPORT_SYMBOL(ath12k_ftm_mode);
>>   
>> +bool ath12k_init_ok = false;
>> +EXPORT_SYMBOL(ath12k_init_ok);
>> +
>>   /* protected with ath12k_hw_group_mutex */
>>   static struct list_head ath12k_hw_group_list = LIST_HEAD_INIT(ath12k_hw_group_list);
>>   
>> @@ -2323,7 +2326,14 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
>>   
>>   static int ath12k_init(void)
>>   {
>> -	return ath12k_wmi_alloc();
>> +	int ret;
>> +
>> +	ret = ath12k_wmi_alloc();
>> +	if (ret)
>> +		return -ENOMEM;
>> +
>> +	ath12k_init_ok = true;
>> +	return 0;
>>   }
>>   
>>   static void ath12k_exit(void)
>> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
>> index 59c193b24764..f35571b1a541 100644
>> --- a/drivers/net/wireless/ath/ath12k/core.h
>> +++ b/drivers/net/wireless/ath/ath12k/core.h
>> @@ -101,6 +101,8 @@ enum ath12k_crypt_mode {
>>   	ATH12K_CRYPT_MODE_SW,
>>   };
>>   
>> +extern bool ath12k_init_ok;
>> +
>>   static inline enum wme_ac ath12k_tid_to_ac(u32 tid)
>>   {
>>   	return (((tid == 0) || (tid == 3)) ? WME_AC_BE :
>> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/core.c b/drivers/net/wireless/ath/ath12k/wifi7/core.c
>> index a02c57acf137..542ec10fabf1 100644
>> --- a/drivers/net/wireless/ath/ath12k/wifi7/core.c
>> +++ b/drivers/net/wireless/ath/ath12k/wifi7/core.c
>> @@ -38,6 +38,9 @@ void ath12k_wifi7_arch_deinit(struct ath12k_base *ab)
>>   
>>   static int ath12k_wifi7_init(void)
>>   {
>> +	if (!ath12k_init_ok)
>> +		return -ENOTSUPP;
>> +
>>   	ahb_err = ath12k_wifi7_ahb_init();
>>   	if (ahb_err)
>>   		pr_warn("Failed to initialize ath12k Wi-Fi 7 AHB device: %d\n",
>>
>>
>> I don't like it much but it is easy enough.
>> But I don't know if there is a more idiomatic way of doing things
> 
> I'd prefer to expose a function rather than a global variable.
> In other words keep the flag static, and expose a function that returns the
> value of the flag, i.e.:
> 
> bool ath12k_core_initialized(void)
> {
> 	return ath12k_init_ok;
> }
> EXPORT_SYMBOL(ath12k_core_initialized);
> 
>>
>>> Or may be have this allocated on first device probe and free it on last
>>> device deinit ?
>>
>> That seems even more involved. It would be easier to go back to the previous
>> version and simply, alloc it once per ath12k_base
>>
>> What do you guys think ?
>>
> 
> Going back to that may be the better solution. It isn't nice that this current
> solution may allocate memory when the driver isn't actually used. But I'll let
> others on the team weigh in as well.
> 

Yeah, allocating once per ath12k_base is definitely the simpler 
ownership model.
I was only wondering whether sharing it across devices might be worth a 
look, since this is per-CPU scratch space and the table itself is fairly 
large.

--
Ramesh


