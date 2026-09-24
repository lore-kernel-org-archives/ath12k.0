Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D6AC98314
	for <ath12k@archiver.kernel.org>; Thu, 24 Sep 2026 07:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iVUNZgEIS+X03uUzTSm1RFpXT2eTKHvCGErxEsgflCA=; b=ltRqHl5dXVY7MgJxov2Xdg3C9p
	AjunT3UBgAKCrqiCaus2jB9LDWy3d7BHubMP85qTGtg8akqEi+yaBOw8NvcjYbYetFNq4i1pBzqzQ
	UzR0J743mAGTNtx4SzD/CYhP6+5DjYUyPHED5gW3Y0D4NKSK6zRB3eHaep8/cUN6BNtAWsR1X7NqW
	TUWy6PksFu7/A51n31ni3jWzOxw7MaAzO/z5gRgJ9m6AFZaAMf/lqeMNUxb7KIJwePD9sddQDVwtx
	a8GnzIfxrJfqcVLITilcKuejFL4kdo4En0I1tPFZUP1Pwal3/ZxdbfYpwZeauNM2dqfwjeLxzCwl9
	ZUUO7FTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eJK-0000000AMns-26ck;
	Thu, 24 Sep 2026 07:56:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eJI-0000000AMmL-3lsa
	for ath12k@bombadil.infradead.org;
	Thu, 24 Sep 2026 07:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iVUNZgEIS+X03uUzTSm1RFpXT2eTKHvCGErxEsgflCA=; b=jLPvXZpYHFkuozUR/neF4Nd8GW
	ECcqM9VLsZovDvqjGJav5jD2MjD8+Grg2TU/WLvNX0YSQQ6mf3nXmJTtbexFyirRTa3L3v2LyJBBH
	J/PazxUmgNGFuPG1XZYl+I12pvkpK4gVfy0p9LOyF4HBR1Gp32xZ3ccWOAojRgwROIpojruawAb3A
	Y6YIe5embGclsyoIX4aVk2sZ1nDSfRHFBL749zvCaM1T3cram8dVc7gqCtF3VoONXvnsyUsR1JuZV
	pBl21kpYkx9xQuzZd/UYNXcLrS1GP31N1YouXYF4MXrTK90xWd2n4l7lFKcou/6hdcIAtA1gSQ0br
	vGcdmGgQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9eJF-0000000FgYT-1oKF
	for ath12k@lists.infradead.org;
	Thu, 24 Sep 2026 07:56:03 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5e5Rd567471
	for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 07:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iVUNZgEIS+X03uUzTSm1RFpXT2eTKHvCGErxEsgflCA=; b=SM5uZq0qPdth6495
	aqFd0Blv8/Ae0QmHg/glmnIshjGVEg0EmM4YHFX8oH57tmBOG+Xu2Fy+WziqhloV
	iUHEza84rvHPPAAvAoP8yMn0cGmAjazHCR90YS7MfvK78NJ3sfI9G/xrEQ/S0D/Z
	AjVeAYtEjYrz4qkWPm0GTlabvsPII+gyvEVK2jPst9UkmU8GlA40OlRUeV1wLO/m
	ZyhG0KQWleF0TRU0OX7Du5YGxQgFJZbGZZM6JTssR3nmjRcaZMmSwPITKJmJPMhT
	sl7k3HPyM8On7vsKoX1EvWslFsbLZJp/cPwN29bx5hsXZA2h1uGrJ8xtjEFJVnoF
	KM00lg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvgh8sv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 07:55:57 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-143803143c4so899989c88.1
        for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 00:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790236557; x=1790841357; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVUNZgEIS+X03uUzTSm1RFpXT2eTKHvCGErxEsgflCA=;
        b=juUSLN1X9YJJBI0Wbnfha+PyErvzFgNk8wChZrc3CyNHl7grwzvjl5yYgeSNHJRrI/
         Z/XOevXrjoL79QcborSbi9kmB9AmO016EPfDR4E/yWOFUfJYgyAvzsnOqK10ToD/8X+W
         c71I+XbC+jvnOSuff2U1EY8nC1cXziuUlhxWPpgVzOe1dFH9CfKxFLk5sLSPDGMPv2mD
         oP1hydPZ/hCYPicsuEbFrxpiSyeTPGduSXdBDDH1B6kdfMmo1KL7YR4Q4N2KipURsk0z
         MYh4xImnDGLfpawphAIiPYVO4P5XbrhCZGk+lWM4OklLWvfU3jVrOBSe9xzrfueKm00t
         Lb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790236557; x=1790841357;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iVUNZgEIS+X03uUzTSm1RFpXT2eTKHvCGErxEsgflCA=;
        b=LkX2ffW+KbETvv3tMPzRNQYso/eHX/3tHG9VBiSSc2m63eqdoywjkOCVp5zmlJsERI
         hDUsAzqR7mLi/w5D3pOGhx/bnR+WE6j43ukTSIT2uRsbgx5NMbUwHTouKx6RWuWn/eaz
         EeDhiVGfGfOz2/Bkin4ft7kfcLS1dfHkyaswxrkZcGvVYLhoq2uWdZKHUaLV0N/tHtYz
         AHjYk2p6tW6hzRJsyccNVwcbkSR2uomGhAKLDXw1KsIe3imKdiTvztt2W+2wZeIni+2G
         MQrIfyPaKq8QTw9p0xVommCxUQKk7JgUTJTdLUoA0qO9O3XcyJXtFpZcoYhg6ppnmiw5
         NSHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhtpglJ+BrDjGWAykclwBcIkZKS9DnYvHw/MkaZTmv3RAYGrDE9HHoYy0grz6J3xVpu1KNs+g=@lists.infradead.org
X-Gm-Message-State: AFuF++nKbr4IcjLEUWeBq2ICjxTlNh5ekglv57mvThD05gyIBsnc94GP
	LY3dzOgIRegkWQ0qjF9yLbcQ+GxDs7uBJcPIpVaCLXfcDQZtvtqMjD4iIn7Xrr0sRY4kCEEP1Km
	JIL2RbBBhuyOT7yrzW8vyXfpdL+L7rC4nIaRBM0BUSyJdCszC8gOBCkn33uMqWeoV
X-Gm-Gg: AYBFou0Ai3b9VU0X8RztYFv3Ar0sS/t/JhtKuGy/yFE/EN8rb/1dCJRkTl0by5oidnL
	XnVl4B03m34bNXOJSTN4jhSWK5tIbTPttTY1tCI6D1k0kUXDjev+gW5kA4a6MeXwrBg68683yFq
	Aw0HH8sO/Hb2khAnVIp39ded3UzN7qUS9tdSTU3HThtssZNGCzJ+anzYsdMnXMc+FV4j6Hj0gWn
	9s5CrsyF+M4F8VCAJ+nZnRictGCGhsejEtrDMkRnVujhjxNk7zRZGsAAlg2rJmrU2GGJKL4G9yh
	jenbTSbrD4cZmO5mcfwYUkthh0Momxb5HIaoUCX1GSc0SFPOwtOo1Xe1rxSIW1JkV3yvrUbb4qk
	LdbyLsdLuAyIG5nOmduL7DGG46uXF508BBjdugyiXCcrEA0kcT0Pqv3LRoyg3aTjj563n9iyU8y
	qiRKuQNPZaybIAG8D9Gw==
X-Received: by 2002:a05:7022:296:20b0:143:26cf:8617 with SMTP id a92af1059eb24-14504007496mr1227674c88.25.1790236555528;
        Thu, 24 Sep 2026 00:55:55 -0700 (PDT)
X-Received: by 2002:a05:7022:296:20b0:143:26cf:8617 with SMTP id a92af1059eb24-14504007496mr1227650c88.25.1790236554818;
        Thu, 24 Sep 2026 00:55:54 -0700 (PDT)
Received: from [10.79.124.251] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f988342asm10934708c88.11.2026.09.24.00.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 00:55:54 -0700 (PDT)
Message-ID: <30303e94-f0a3-4e91-8690-006fea92dff4@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:25:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 4/8] wifi: ath12k: add device DP stats reset
 support via debugfs
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
References: <20260819053247.1420393-1-pardeep.kaur@oss.qualcomm.com>
 <20260819053247.1420393-5-pardeep.kaur@oss.qualcomm.com>
 <435e3012-9b6e-4327-97cc-f65ed1e0e5c0@oss.qualcomm.com>
Content-Language: en-US
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
In-Reply-To: <435e3012-9b6e-4327-97cc-f65ed1e0e5c0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab4d78d cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KfRVG6JlAz8oqK73lFAA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: nuN5lTOHCk9GrgdCNB4-SeXqvveiUIBi
X-Proofpoint-ORIG-GUID: nuN5lTOHCk9GrgdCNB4-SeXqvveiUIBi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMyBTYWx0ZWRfX4q11+AmDlOrO
 dWbkhNPT9vCoWzRBQ9ZRt/XAEPxlJzJTvS0b0tWu0/XzQdSdSjAov0ZHOU2CLlkJMpS2MGtjyHg
 8kbjSF7V4+ffqs84AS2K3d2afo8UVa4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMyBTYWx0ZWRfX28ojKvwOd+rM
 J64ZIBdJU8TFJOO6UCYFPuDkeFK6d3SanXAdWjv882MqZ7tgiBhlj5Zuqo3RKagTSHp8hzauFUA
 LbsNQsiIhmiFGmF6l5JJiGrvocG2/BPJC9gTB0WqmfYdUYnLONHOB239rpItK6C6Nl5QxPWjl5W
 gdsWgPqPD5Yx8OucYrWfrE3s3P+ToHqbG8Ot6dWU/YmHJz004RkiPRrnOAATiS6hRdV4oUCSDs7
 7Z7mM4cdCDkVzgCkQfIKM14EUrGs9ZdXNB6ilyMGfKq+yGwc3hQfR4+StnGmkUePVUj4zwg2F2s
 vpm3JGmPmPuutk+Zcw8H5q/OPl7cSGjqRxgaiCl+j6FdpAzrIz2UbbApx1HPTHpYwkvzb70m5Rk
 EUw+yQq/svJZWvL6eINrNc2hXkmfh16FgrQWvaaC6cpPKEsB9wUktEd3HDC6gTsRx1pgI3e1vAb
 /YxNrjMxcDeqrEwXcgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_085602_113001_3F483D76 
X-CRM114-Status: GOOD (  12.23  )
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


On 23-09-2026 05:42, Jeff Johnson wrote:
> On 8/18/2026 10:32 PM, Pardeep Kaur wrote:
>> From: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
>>
>> There is no way to reset device DP stats counters without reloading
>> the driver, making it difficult to isolate issues to a specific time
>> window during debugging.
>>
>> Add a write handler to the device_dp_stats debugfs file so that
>> writing 'reset' clears all device DP stats counters. Change the file
>> mode from 0400 to 0600 to allow write access. Use
>> simple_write_to_buffer() to correctly handle partial writes and
>> non-zero ppos, consistent with ath12k_write_simulate_fw_crash() in
> in what? the last sentence seems to be truncated. Or perhaps just s/ in$/./?
> if there are no other comments in the thread there is no need to repost just
> for this. Instead just let me know what text you really want here.
debugfs.c.
>> No lock is taken around the memset since the counters are updated
>> locklessly in the datapath; taking dp_lock would be misleading as it
>> does not protect device_stats updates.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
>> Co-developed-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
>> Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>

