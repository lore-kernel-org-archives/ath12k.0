Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFC3CD6E56
	for <ath12k@archiver.kernel.org>; Mon,  1 Jun 2026 12:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nuUuljBbgksxvPZFXSb7ZmCvFOgClD/wsWTuDPMfmjA=; b=AjXpKyk6j/AwEPo5asIYQuwaWM
	LxBOayUxSDf22yw9yDORaG8QH+rkCkrjuxNJI1NHXQBPm9pwD0I73F9qDTB6ZCsoreWiVEqylZ4XD
	dxJcLvs7B5Wrw0T0rXvESaQdZrRVh7F3IyD/FYKSGAF8WlD5Z1UcjlkE6EbTrwgM1RJpcWSSZBnVI
	9HT/dluXSO/+qcIb6x7nPgxa24pf4bbGjBupyWydMpzO8C9XEYYt0HqcjwoidSrpSMegym2qP8gNf
	GhV9JCVZpYoAzKVnAJFcqJI74heTSpAN4wtwu1N/Sq+RuJLturNRXuKqcjx0tov13Ft97XKMdQtds
	SpJfnmNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1k1-0000000B7v7-31EG;
	Mon, 01 Jun 2026 12:27:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1jz-0000000B7uf-0qpQ
	for ath12k@lists.infradead.org;
	Mon, 01 Jun 2026 12:27:36 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518e9sL1214120
	for <ath12k@lists.infradead.org>; Mon, 1 Jun 2026 12:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nuUuljBbgksxvPZFXSb7ZmCvFOgClD/wsWTuDPMfmjA=; b=A+sOntu1GN/c1ZAI
	r033sZvw/cZbjkqQj3rw5B80T50jQjsifugyRLuVKoLBcbvH/mYTWnW4zFtcX4KV
	6EJzi9HBVwwB6quBzhvCSOzU+Yo9rd/IV4Sxzl5lPA9SEMDZxZgt3i7h1c1fwtsl
	s21qVFSor8hOiNcBXmOLByR1GYZKIhD6Zs+q34KmnwjlfPyjKz0B/r2/jJLI4TIm
	czQ7Tu534+ikTuAlZAEG1oDcbuVmcruGMeQ8fR+FHljhL9pUJtC5ibanHbGsKxYY
	5Wq/SqOtuFQzNcYB2Xz+lM9JrDnZhMDSmGGaxGiwlYQf7yg8YR5ym5ryDNXrn2KQ
	Z1G6NQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s98wua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 12:27:34 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84235f9b91fso1181697b3a.2
        for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 05:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780316854; x=1780921654; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nuUuljBbgksxvPZFXSb7ZmCvFOgClD/wsWTuDPMfmjA=;
        b=ZlhygO1E8NFmYxDb+yGJFUxc4Iho71HE9b1SjmrRQbWdjvZm0MynMgk9oXER6WgIVk
         T/4wPXcvKjj2SHDDSR6QNFi9JRo41BWS0GQBQBgYTCkK0EzpgZgvAORxr6umQrZBIvGj
         sOg38WtnbfnMzeB91/dAP3m7hcmefqD0JolohhfMibL24mAIZ7vquZ9nc9vhBbkdFQmM
         YF7ngTlLddt6VzcQRXhx+ufmnAwGWAcX7no0Z1k7SZADmTJT/DMSL0GI2lVd56ogLe8b
         VyoWv0L3fCuza9mAMO0WSvSUHSKwxezFTgzxH8Of9s3lAYMTjaBkSu9LJGvT+ZRJgyKS
         ZYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780316854; x=1780921654;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nuUuljBbgksxvPZFXSb7ZmCvFOgClD/wsWTuDPMfmjA=;
        b=GfZdhYXXfN62gTSc5exAzSidZQxFMRQFcht+v+FND6yTaTMXzrIp7VbSXpO31sAS7S
         QNsFfTlEciqjggTGyRNfM2xR/Cw1YM+T8w2zdUekGQ0dTMbyJU+aYZarkL7oAlKT3s/y
         A0gi6zNdVvy6MIQTfGuVyr6rTdthJyC+RGn3TxZOaPANNfPPIAVUMYnmGw28l8W5F4mN
         N/t4LVA6y8u7YRV+G633iKNJ0uFhscgdyAP47A0kUDq5ymIdadChLahUDWz8qHQ0bHJi
         Pw6aoaXWMAyGrZQlk0f6EQzRVjRe3tjh0ZYS4fucLt6RoFKGLiYWJsPFHXHnWBfAQcXq
         sWkg==
X-Forwarded-Encrypted: i=1; AFNElJ8f8NTvDhtL5zrlETLr5+ClxjpC23cGOygszRdIxutBtAee6biWO01xYBH7FkpqhkOqoYcqF0M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yznr62JL79Heiq5sfLOr3F64BOvtvjfaTYobMnrMQ8p2rtQwnSP
	iUSkCBhMxV4mvh4cHbRLTSzlntU3lG7ET9yAqb53S7kMwTH4IU0+BjJdZT3BFXKvbCxgKR3Bwlj
	sLOBcZFlSNs4Zi6G6wsViYJ+2n81FtimFLoDPPB9surhiO52WWwkOcdpIwmVnpPCp
X-Gm-Gg: Acq92OEKiMW2gMRK0+uWMlUuU4Fdq2Wu6asNTuYjkBZ3OPiaPb7N+NSTmMaAFW/wy3y
	L9onG7f8lUzOtpA34aWAH1jDobmqsXwRuJ4BL+t9DI/o9cVLq33HRP1Yn1Z7a11hnN2WZEWr53L
	0PIlUJlucS2d5T0sqQBcnMTNRlh9b2/t6hvdix4HOCBYv5hEY4oMkz0Psa/cH0PrhzfwHHkSBk7
	VOcR3sLHWaI7x2h9TqVocuR6nHasrbOxRtw0/12QkNfk26BIp+SN+gDXSz5NHoGBxRZyG0anQgn
	4QaXV3HRoOFygLD9H5M1NbNVwkSa02mbPmzu5O0HT/olJFtuNkbn5LA2dotfXQjH/JNYJP6tOPZ
	T1U2jb8GblIfBsw4EtTWBSDOT3o5s760ZlBeU757WAzozaR9ecJC+Z7LoYZKVzLY/iyGF07g2nY
	My
X-Received: by 2002:a05:6a00:1da1:b0:842:5c90:736b with SMTP id d2e1a72fcca58-8425c907e5amr2335982b3a.29.1780316854061;
        Mon, 01 Jun 2026 05:27:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:1da1:b0:842:5c90:736b with SMTP id d2e1a72fcca58-8425c907e5amr2335962b3a.29.1780316853602;
        Mon, 01 Jun 2026 05:27:33 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.82.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84232ef8172sm6936467b3a.12.2026.06.01.05.27.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 05:27:33 -0700 (PDT)
Message-ID: <2e69d977-cc1c-4eca-b7b4-edbab194f5a7@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 17:57:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath12k: fix incorrect HT/VHT/HE/EHT MCS
 reporting in monitor mode
To: kwan1996 <laicheehou9@gmail.com>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
References: <20260507015336.14636-1-laicheehou9@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260507015336.14636-1-laicheehou9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1g7ytLxO0X_nvL0nTEFXVNlOXshm5lFB
X-Proofpoint-GUID: 1g7ytLxO0X_nvL0nTEFXVNlOXshm5lFB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEyNSBTYWx0ZWRfX9dmV/Id7RjB0
 GdPyCAqKgAtTo6VLVkcJb4MAfzfhvBKO5fL5RiBUlepurkedfkp+2HALIGffyzOdCyTr1jgbA6h
 mlC0XbIL++L8Ut3aYY3pWX9L1oe4UBeAYJFS1V5ACaYzfXenE3+TQyJUVY+QwaEy7ek7o5/GNPb
 2oBL8ijdm+p/oNptlxuNVYpPGEEuX8gFRMdTQV92tc5nXtdhNEAXpiK9uoDzaFi9cwdFX1GUewK
 PJ68qD/mLLPQ9q6/+PJemKM3jo+VYNhXYoTm1/f+WqcaBZknQDsieK4uIh7VK8cO6v0UORYYYW6
 ZeCh/s2OpvwUR3AR4/tnp+u6XFr+FGkUL9laslp5K3FCrUdHX7yjdao4GsCs2/2nPI2NJZWdGsA
 oEk9Z7tqc0bv4OPJ+VZnopQ0ONzT7NJZf6TUZzihgrYeVdTuPsJAaNlsZ2lmQ/rcc6NAxdY6DHN
 zUjvuzdBgi+t+832E9w==
X-Authority-Analysis: v=2.4 cv=Zo7d7d7G c=1 sm=1 tr=0 ts=6a1d7ab6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZCREz13nqshT/on6E9YcPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=aFaa_7U1rZJxK4kPejAA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_052735_248129_EA381168 
X-CRM114-Status: GOOD (  10.57  )
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

On 5/7/2026 7:23 AM, kwan1996 wrote:
> From: Kwan Lai Chee Hou <laicheehou9@gmail.com>
> 
> In monitor mode, the driver incorrectly assigns the legacy rate
> to the rate_idx field of the radiotap header for HT/VHT/HE/EHT
> frames, ignoring the actual MCS value parsed from the hardware.
> 
> This causes packet analyzers (like Wireshark) to display incorrect
> MCS values (e.g., legacy base rates instead of the true MCS).
> 
> Fix this by assigning ppdu_info->mcs as the default rate_mcs
> in ath12k_dp_mon_fill_rx_rate(), and remove rate_idx assignments in
> ath12k_dp_mon_update_radiotap() to preserve
> the previously calculated MCS values (including the HT NSS offset).
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220864
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ
> 
> Signed-off-by: Kwan Lai Chee Hou <laicheehou9@gmail.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

