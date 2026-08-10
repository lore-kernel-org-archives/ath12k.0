Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19F2C5AC82
	for <ath12k@archiver.kernel.org>; Mon, 10 Aug 2026 04:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArTpDam5bh0KLdnINtdiE20WeCWsVmySFXjbwgWmPwE=; b=gm7onns+c5qc/swSbAWpzm9i/6
	Ick/H1Jt5HdkHw7z6i/a5bf44JjzAEj9hHGB5mvEHsr69xZyuXOJceWh5Lfjfofcs6wzRg1smPV/e
	VOVt3i10aSMhRNquZLpzLc6jVWWRULNbbaooNuYwnvUWmkMlIfg1vpODLdfvevxURKJKjW8ITAO0Z
	3OgZcTfcMI5OVW73OCsuV5U05Bcvaskw4yCZpFm4aTwWIGzOp7/T+Wwlizf7EgEFtp2v/4cbzBujy
	q4/ImfAYw+PCR1wwpVbcqqL1d2VNjkLakNRJe6Gh+OgSfYNoE1kmUuo9ClmVLOjOFIEVMKPofQLrC
	3fIw82iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtI2X-0000000B0uk-2kVV;
	Mon, 10 Aug 2026 04:55:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtI2V-0000000B0uQ-1Pu7
	for ath12k@lists.infradead.org;
	Mon, 10 Aug 2026 04:55:08 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679L7mML3436725
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 04:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ArTpDam5bh0KLdnINtdiE20WeCWsVmySFXjbwgWmPwE=; b=Z4nak5RFWZGgUquk
	m94HXSBn/J9iD0zhM6QbhOqSHrHvSSmXxWaPDP2/ZYc02OtmPaRaAv38OH8A548W
	oKGwZ6hG2hmmWxFq7wVS9/oldFsCT2OtVd4FAUec8Ziy97ri63Jq5/qkm5QoQZvA
	MWRmO5M2gZYpWcOvz9Bppze9OmkaAwCerMfjRnF2TVsLwDSXkAVF0e26BRQflsQa
	L/RMa5HUZ7+oj3xn521JZycyMNCtkxAZ+YdpeOdfTs7Fbv8sh/OJiQrvxGE6LOJF
	W8JlaPr6kaND7q2++nkgkeoHtAhVXM4IO6kIi/OEK923nlPxJXfNRZ+noUp1nHgK
	+gqUfA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwwr9m9a2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 04:55:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbbb9c9bfc3so897785a12.1
        for <ath12k@lists.infradead.org>; Sun, 09 Aug 2026 21:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786337706; x=1786942506; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArTpDam5bh0KLdnINtdiE20WeCWsVmySFXjbwgWmPwE=;
        b=RXBFLoH6A0BJBq1z59tcsQHNK3l7+/LoO0OgssqU7ISqu+wmX9mj/8/OUWsvVv2ZzF
         gYVU/2IcEyBDZrJeTjD3cSrnW9WxBrqSWHsh+pN5rFuHj57r8RFPScwMlteGqq+1enZe
         b9CA5IecxzypFQ4dkossQxQXtlOSQC9ksdi3JS0GRpOxz0XbqSgpAdrULJABqNrjyF6v
         +8uZ3SkVsOYpAeLAXJsECFqWTc4/gNCpoVOcr49BGhWCqjHfnl1sTD0JTUKJzDN4qP5Y
         WlZ1tQKwVYrKovqFlNuRhUqvSjq28KfOavHupFN/8FzMCAx5q5jeieyDYZSS822Pgnke
         qIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786337706; x=1786942506;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArTpDam5bh0KLdnINtdiE20WeCWsVmySFXjbwgWmPwE=;
        b=kIJ4MTSUkyHaBO0K6w170zuLNZrr2HBWfzpb6/5J/QrgmylIrfQGDnL8N23QAuDc84
         z7v+Rkzoa8X9a0+aVmtKjC11gfgDpk0qEmNvMZrOgglQd5njeyZkwjurmaI3R1dMqWw1
         9cd6XyfbrQL6Coihrlup1/SlNqyQCRObHRIh0lKg9m3m/VxOW1CvFheqAybJ1uQfGUKZ
         QMVEL4+r1N7xudKuMUMd/zUBjeq/OeyWTi6btSFk3Pv8eWdBE3FWfOe7Jvplx2+lWJdW
         FtZkm87kqAyIRtcY8ZKuiLhnQJsj5gz6rhsL17Ul9KRVj2TlbyNlQK7us9mf2m8Wey/7
         PGeA==
X-Forwarded-Encrypted: i=1; AHgh+Rr8R2KBelUcjPvaUVFxd5bzAcctks+hldjg/tpe0+OGKVU8CO2VZNjVbSPq4YdNfIIppycWlOI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQjj3HdUPskZ2dMobgQbDqb6Mk1NHKOVJgC8Jw6isoPqvfViUl
	etzdDxRGuXnUgWTuT9v3F12okK5Za6dQGpZY050X7wgAaA71lutbf3Fkc6R2u8N1+qb5+lp4XRr
	w1234bKsjmWBMMdriKFZHU5vfA36R88RHuMBGVvBRL11QxaduaFOGuIrj/usu/whLPFYmQ+3F
X-Gm-Gg: AR+sD12V0cvSXiBNXGEYbtyjbt/bIw6yX1x6aZHUj/zbIZLiUPVgWtPEyuwGSBFGofd
	th3xgvXS6vUB1qV6ZT669KsAyGXIzeaL9XKr2YuNGvkplqtYVn+aa/qXi5b3If2H/2bRjB+Gipi
	X/lRHwZEbCeA8Q/5uQSe4qxJA9YFHr9IKo7w1iHkMaY7NXkTWKvTRfEtT14RlOQ7GoC4hN26QI1
	XZw2K+idys1owicUvtQjGyUg77S1xcHLglY054TMjMmDCED6RJ92TkB4sQWBFDmD5M58+03vfkB
	hKSvZ2gGEKnoChDoR56tJQf/6v1WuKphvI/DbjQffTVYnS2h/GpJp3WQQdkwXeBD9Fb4S8hRjO2
	T/A1DAjpIirsgxfhXPkS1KgUkmHXfVPzAoDV4kDTyewYXCyykhm77OAvMcu3j2eQfnTUyMTjj3s
	0h6kETb+DT2oxTSkVJPw==
X-Received: by 2002:a05:6a00:2393:b0:847:881c:7026 with SMTP id d2e1a72fcca58-84f69418396mr14737203b3a.3.1786337706097;
        Sun, 09 Aug 2026 21:55:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:2393:b0:847:881c:7026 with SMTP id d2e1a72fcca58-84f69418396mr14737174b3a.3.1786337705575;
        Sun, 09 Aug 2026 21:55:05 -0700 (PDT)
Received: from [10.79.124.186] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3a0f8dsm3248601b3a.12.2026.08.09.21.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 21:55:05 -0700 (PDT)
Message-ID: <89f8b7d4-fea5-4b22-b5e4-07d8de06eeda@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 10:25:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 4/8] wifi: ath12k: add device DP stats reset
 support via debugfs
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
References: <20260806132427.3704828-1-pardeep.kaur@oss.qualcomm.com>
 <20260806132427.3704828-5-pardeep.kaur@oss.qualcomm.com>
 <9dd4f651-3437-467f-9994-93b92a83270f@oss.qualcomm.com>
Content-Language: en-US
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
In-Reply-To: <9dd4f651-3437-467f-9994-93b92a83270f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d73FDxjE c=1 sm=1 tr=0 ts=6a7959aa cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=AFajGRLNYAwZlwsr5FkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: HlV0SMSPg8mNvcrgaYsD9Iux6FK6Ds3i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAzOCBTYWx0ZWRfXzPjwYWfLBxHZ
 TRfGhd3vfbM0uQb6UXgZfhKkROFYqtKc1HocIRWzdsoVgGIFOjzL9sHXF/uRLQvJG4exiF8QtV4
 ycLU5Ze6FofEIZimMeBiFedmTcmb4Prb1476Zuw9GqJhAIRdRY1TyOmWvZCh7eVjG6slON4UcwY
 dF4CvjguVapyoXmo3hCyVL6bs52Z1fswpG+dZrXgLrOlqEK5xdoJHiHuZ0Dqfmj7Zhu4+iB3Izq
 L/lpm/vAX5akFZJOvSLgcNXsnhy2Khq7KFasdRZVo0puBGmwmTrM+F8JdoyLMkSz7H4+wMGiitY
 ewoW1STUS8wJyuVsq/ZzgDPV+5X3Uyj4cJFpTPZ9zwPieLAPPoWWVjdanZUcnguiSPm95ApA7+3
 13iAQb+00HZkCd4SLy9EDZF4XLZWD3+7SQ54EmHs4VpSU0h6NDhvo8FjES26X7CCsurbMBnsyA1
 Ogbhqgt8NENt+Qq/fjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAzOCBTYWx0ZWRfXzHSata+fJQvE
 zb0f55YcXqhnwn6/0DSmhQH2CxpzZPMu3xjc4JRu8fNDLBty6y+BNs8BqOZud3cerzV+S2RGFt3
 X/1P1R82vr7esVmIVPSsKO5WNO0CUlY=
X-Proofpoint-GUID: HlV0SMSPg8mNvcrgaYsD9Iux6FK6Ds3i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_215507_393203_E5913849 
X-CRM114-Status: GOOD (  22.65  )
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


On 07-08-2026 07:44, Jeff Johnson wrote:
> On 8/6/2026 6:24 AM, Pardeep Kaur wrote:
>> From: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
>>
>> There is no way to reset device DP stats counters without reloading
>> the driver, making it difficult to isolate issues to a specific time
>> window during debugging.
>>
>> Add a write handler to the device_dp_stats debugfs file so that
>> writing 'reset' clears all device DP stats counters. Change the file
>> mode from 0400 to 0600 to allow write access. Use strcmp() with
>> newline stripping to match the input, consistent with the existing
>> pattern in debugfs.c. Return -EINVAL on unrecognised input.
>>
>> No lock is taken around the memset since the counters are updated
>> locklessly in the datapath; taking dp_lock would be misleading as it
>> does not protect device_stats updates.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
>> Co-developed-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
>> Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/debugfs.c | 35 ++++++++++++++++++++++-
>>   1 file changed, 34 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
>> index ec49692107a8..0e446a666f4c 100644
>> --- a/drivers/net/wireless/ath/ath12k/debugfs.c
>> +++ b/drivers/net/wireless/ath/ath12k/debugfs.c
>> @@ -1220,8 +1220,41 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
>>   	return ret;
>>   }
>>   
>> +static ssize_t
>> +ath12k_debugfs_write_device_dp_stats(struct file *file,
>> +				     const char __user *user_buf,
>> +				     size_t count, loff_t *ppos)
>> +{
>> +	struct ath12k_base *ab = file->private_data;
>> +	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
>> +	struct ath12k_device_dp_stats *device_stats = &dp->device_stats;
>> +	char buf[20] = {};
>> +	int ret;
>> +
>> +	if (count >= sizeof(buf))
>> +		return -EINVAL;
>> +
>> +	ret = copy_from_user(buf, user_buf, count);
>> +	if (ret)
>> +		return -EFAULT;
>> +
>> +	/* drop the possible '\n' from the end */
>> +	if (count > 0 && buf[count - 1] == '\n')
>> +		buf[count - 1] = '\0';
>> +
> my review agent says:
> The new ath12k_debugfs_write_device_dp_stats uses raw copy_from_user(buf,
> user_buf, count) and never checks or advances *ppos. A write split across two
> write(2) calls (non-zero ppos on the second) will copy the second chunk into
> buf[0] instead of buf[ppos], silently failing to match "reset". The existing
> ath12k_write_simulate_fw_crash in the same file (line 63) uses
> simple_write_to_buffer(), which is the idiomatic kernel pattern here. Replace
> with:
> ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, count);
> if (ret <= 0)
>      return ret;
will follow the existing pattern and update the patch
>
>> +	if (!strcmp(buf, "reset")) {
>> +		memset(device_stats, 0, sizeof(*device_stats));
>> +		return count;
>> +	}
>> +
>> +	ath12k_warn(ab, "unsupported command: %s\n", buf);
>> +
>> +	return -EINVAL;
>> +}
>> +
>>   static const struct file_operations fops_device_dp_stats = {
>>   	.read = ath12k_debugfs_dump_device_dp_stats,
>> +	.write = ath12k_debugfs_write_device_dp_stats,
>>   	.open = simple_open,
>>   	.owner = THIS_MODULE,
>>   	.llseek = default_llseek,
>> @@ -1232,7 +1265,7 @@ void ath12k_debugfs_pdev_create(struct ath12k_base *ab)
>>   	debugfs_create_file("simulate_fw_crash", 0600, ab->debugfs_soc, ab,
>>   			    &fops_simulate_fw_crash);
>>   
>> -	debugfs_create_file("device_dp_stats", 0400, ab->debugfs_soc, ab,
>> +	debugfs_create_file("device_dp_stats", 0600, ab->debugfs_soc, ab,
>>   			    &fops_device_dp_stats);
>>   }
>>   

