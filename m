Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1F3D25030
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 02:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+D+iT3lzRq7zttSLD6Sn1LjywyNGpeqN4LV106KgzVY=; b=1KJpEKIRjS36wORHF8JjmGzjHK
	xm+qdMLoGshcZyLBI7hYTrS6XesIBgHZQL7sGYhfQ01ul9gASWlk1zbx8nMei+h+JsDokoqV5lwD1
	yInDRahwXXi85PcatKvtToqlizQLxsyHAoVYnEWkxYLmFyFxoEw5DifBAqm37qE4kv1gpoUs0Etx3
	9tuVo8KT4tG7qFhP32dULdOshmS9iP4yZhnAD48aN86wW7ZMcLMoJg6pu/1flKkHTpEsIZ1dwKC6a
	zdY1R1C82Z/Sqa0/cp2VGZT5OyD1KZGvDy0j4xlatbpJ/K3gwAxq5TVsjrsF55sYJMLAmtjvKcztH
	sPE2GvCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf80c-00000004h7v-1asL;
	Mon, 12 Jan 2026 02:50:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf80W-00000004h74-2BOI
	for ath12k@lists.infradead.org;
	Mon, 12 Jan 2026 02:50:19 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BMdmNv3938278
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 02:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+D+iT3lzRq7zttSLD6Sn1LjywyNGpeqN4LV106KgzVY=; b=kcbtGq+6YKQmrueQ
	YjHaPxWxUkaaaQPgE/Uo49vx1Sq2nFa4iE/NC6UpGnbMFKqPbtJM4fTybHufcBXA
	j05TNuzl5YadHc/gJUK6UzxSkx9pyN4Ol98ZLHyGZKXX2oYNEUT9zbRHEJBU0ptR
	igrdP6fUJQ90o1+zd/E63b2YGQwgREjsGVaE3ykj2fAFPKzxVbPDvUQ6uuLSSm6A
	sZXtW1XG+Qj/9I2WBNl6XcyBGvikwJXAqVz9W1p/bzULd9yqHEkM/qAw9UwHcW8l
	ChsFOhy42M9t9axfvq//wAByNlYnyxAGioWHBKEl+bWRtqyDhJ0XyCh+3vXdmseP
	dQ8JAw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkeusk95w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 02:50:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0e952f153so155284285ad.0
        for <ath12k@lists.infradead.org>; Sun, 11 Jan 2026 18:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768186213; x=1768791013; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+D+iT3lzRq7zttSLD6Sn1LjywyNGpeqN4LV106KgzVY=;
        b=Q/7RQTa9bXJ/bae3CDaMmlQlTWao/yAVTnYKiS2oqlZVHooGneRH7OZlsLLzcNw98h
         /gjHTqQpqVRrpJmMRW8eJ6C9XyT4zFgXd6t1cc1DyMbxxQM+vSrM8OmU6LsEnOfNUHa4
         4CyW6v8fEL2GJIYZShPYUyCMP2qMLckDbVcwL59VDt+Es3p1S0Wz7gdnWJqYEtfMP6ma
         2N1/KJrszwganfzbTx6yfAkVlGhHPfoQig4xls89PhsJL4L1jGaNuEk4yc7o8vJaCVWH
         I05vZvNM7MyX6HzzC25ZM4mrsLh5m4c7TilhBcOaggzwD/Pw8QVFMovNEFBZnqnexnFS
         tE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768186213; x=1768791013;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+D+iT3lzRq7zttSLD6Sn1LjywyNGpeqN4LV106KgzVY=;
        b=XWmVMMO0je3YTosV2q3aK/T0Xw6NmaRn/OAUBO5fqRP86JU9Jr9zd9LusDyR6cViXa
         YM1hYxL44By14SO2H0t/u3TskK3JZYDu9i4cfvPbduUO3AHZ7dNoLNruBiz8YM7umEwp
         61mtLd/bidsUnOnEMVOt1NjfB+oTST90ZT6irnjE7697K4ok82AWJQVDJVSWfnIuBiMX
         wF8fbRTTttzP9ekk5EhDdCukOFjHG4/A7clsBjuE17QkpkoZbC3OIvdYZ52S8qP++Dqu
         XyFd4gmzOYspMirRZa8dBC5xkXqt2pAsn0ebonnkzWVX2JqOgkOgQAn1qCXv8s4saVFc
         O8YQ==
X-Gm-Message-State: AOJu0Yxklga31dxJFcFaWrotZZxUByVS6rt5bTR37VxP8JfyekmgINxL
	GoqoVrjDaMczkkG2lFhyr2zDKcgQrmv6/AG+fRTXVPd8BpGxvvGfB7AEJQGewC3jEuEjIsnkr1q
	ebHxwpZyRdu0xID6f+UBNNHFzK/hg9Hb9kgkarGbpwWXK/pKSbHjK6fJNkGWkyJ2CgGF6hgwqo+
	s=
X-Gm-Gg: AY/fxX5lraJykG0iUx/IL/LTqdu89Ri3WHebSIuEHrI/c4qU7U6NFGp0JGtqwXYGb5d
	y5Q0Ko1FjFTMUYVPZx7c0jDgQtIHYsoF9Uhbv7IN6xHm2mE/MdVGhbL6chB7RMcBXlXpbkWceme
	T8fVdVi4hqHZqWiZHAZdsQKZCiBN9m2tZZDHB1PLyc7v8G3c5kfZNzTYshLyFI3dou3caACUzL6
	b66Oik3UNGeYDBWpkVv9c/l7eBfbi4e2Vk71nzyhPXlT+VC48hF5jqF+nkYvv5VF7lgdpGWv50s
	Z7+6z9JyLIc8QIW7GaQXDAKLSr6m5qLzKra2Bg3HyjqIdyMLrIpW/we424MoPcenb05xvI7Tbxr
	u8H01pxw/uXdDI5RpteEPjWwisQ8Yhk61q3Xx9OW4G7CohGOZU2LnRIoL+2fYQ2KBgOsoSDh7Fr
	fluw==
X-Received: by 2002:a17:903:228a:b0:2a0:d692:5681 with SMTP id d9443c01a7336-2a3ee429c59mr140322245ad.24.1768186213324;
        Sun, 11 Jan 2026 18:50:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeg/+rX6hIzBoI+tO7CprxuEXaOvvi5bbLyXuRxcZVq1SM0jLOw5DRGf4MGFYIaVIiBV42fA==
X-Received: by 2002:a17:903:228a:b0:2a0:d692:5681 with SMTP id d9443c01a7336-2a3ee429c59mr140322135ad.24.1768186212897;
        Sun, 11 Jan 2026 18:50:12 -0800 (PST)
Received: from [10.133.33.216] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c47303sm157651045ad.24.2026.01.11.18.50.11
        for <ath12k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 18:50:12 -0800 (PST)
Message-ID: <8408d346-4a58-4a5c-8a58-8441621fdc13@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 10:50:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [question] ath12k: support for tx in monitor mode?
To: ath12k@lists.infradead.org
References: <012001dc817e$b8999e90$29ccdbb0$@bvsystems.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <012001dc817e$b8999e90$29ccdbb0$@bvsystems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Lsmo-KyrFecYvGu6ry_4eZfxHBPHR1qK
X-Authority-Analysis: v=2.4 cv=GNMF0+NK c=1 sm=1 tr=0 ts=69646166 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tQU_6yTEAAAA:8 a=2Gi4v8i8P3_ojdOLn84A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=S626a4jVmC0pBN4QtePf:22
X-Proofpoint-GUID: Lsmo-KyrFecYvGu6ry_4eZfxHBPHR1qK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyMyBTYWx0ZWRfX05tJXSYI2MrV
 Z/vGvhm1k5F6QI6C29rd5Zu5mC6THa9kUUlDNmnhSqjzH2qsSTfmS6wmYWUxV0GJ6TlfRCLcjTb
 xY9/r8kZ7BFnKHOmqrlRibEhmw5lRyQ4JTHez4C1xtmuxf0QpdkA9/qf/BsGOWgQx1jZG25ZKXC
 aHgUQ4Ar8P8I90R2scChsFNm2Sd7C0D0N0J0UuPdhSAiDGXMyHTYBrxC/dIpHvoKpTnMy/sXBFk
 DT/RGYJeMpPxjrIkypT/5TElCJH8SadhWAMP5p4gRxFxMXkHwXki2BEu6wOKnSur6gxLQUBZqlZ
 kRRURwd+uXpAF3UKKdeH+9dNXgFGexH4ShRaNpA67E/JEMnQ0q/r877EFFtwpuEG3zexlrbBIhl
 m3HHp9jJPjTXEUgWcyZWovPkzbKi/vumI7WmtePrdT+7VlBW9solyNXuFivYcBsCp3mfA7c+hFy
 lcZQhi1GqEo6p/J0bxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_185016_701013_4D46B5A6 
X-CRM114-Status: GOOD (  18.18  )
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



michael@bvsystems.com 於 1/9/2026 11:43 PM 寫道:
> Hello,
> 
> I have a use-case involving transmitting in monitor mode, currently using
> the
> old AR9280 chipset. I'm trying to modernize, and I'd like to support
> 802.11be.
> I looked through drivers/net/wireless/ath/ in 6.18.y, and it seems that this
> capability (referred to as 'full' monitor support in ath11k I think?) is not
> supported in ath12k (based on the if statement at the top of
> ath12k_mac_op_tx
> which checks for WMI_VDEV_TYPE_MONITOR and bails out), please correct me if
> I'm
> wrong. I also tested with WCN7850/hw2.0 and was unable to transmit. My
> question
> is, is this a hardware limitation of the WCN7850, or is it just something
> that
> ath12k doesn't support? If so, are there any plans to support this?
> 
> Thank you in advance for any info you can offer,
> Sincerely, Michael E. Tuma
> 

Hi, if you are asking whether WCN7850 supports TX in monitor mode, my 
answer is: the hardware does support it, but we haven't implemented the 
code.

Now we don't have any plan on this yet.

> 


