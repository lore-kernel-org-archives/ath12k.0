Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D67C43458
	for <ath12k@archiver.kernel.org>; Thu,  2 Jul 2026 09:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnUR1LOesZgE+LhExMMNkZRlI6t8z7VRKCRBzJBUFR4=; b=z4DBOID0lWbNruX2xJtDrOzYUB
	2d57AhAphD6cGwQ7Dot7aKM3IucgWnkNLHtg4FCGfcZLUzOrDLh/zvABriybXxZFaILQA+KkMGuUW
	dV6nfz6L8H8Y1XBJdFa4g64Z8o3PFQJ0IBJ6OYpXAdD2UF5/dJaRDb2Py8+1QxaIMnPZ3/h4EJQru
	znM3DYV6pzHifum8q+xAMePfa3hPSVkgpSN0HDuoQFF/WzETYf6mU3ZAr3XbjnRIE+1Z8Rz50bCDD
	c009s/VnCtHOPozOQDv0uleLqRg/+tNtSBIiC5DuYmTS1oofGzMeZ3yy7Ey+V/s3R7KK1LsglnwtL
	TLOS1JiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfE9S-000000046PK-3k69;
	Thu, 02 Jul 2026 09:56:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfE9Q-000000046Ox-0a6L
	for ath12k@lists.infradead.org;
	Thu, 02 Jul 2026 09:56:09 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6624lghw3485791
	for <ath12k@lists.infradead.org>; Thu, 2 Jul 2026 09:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UnUR1LOesZgE+LhExMMNkZRlI6t8z7VRKCRBzJBUFR4=; b=o0fW9Z8DPpV5Nebk
	0wNp1ydqmGqi0YInPLG9F9eTTDAe+pgIjnjWvkoKKMJcdK4nbW+c0IB0nCSsczxx
	M5mZ/UX9WWJreEDTB744zcZOSsBJ9Xht9BuO1PImt3tOnhemyVdkBWIlh6FNHHAC
	andSu9HU9egIPz1OwdAl6vMYv9PBZflabA6vDAIBEyrC8xrAw3jaCqzTyMQxFZzT
	HqB6YwHgrNTE+OpmQigzfRKkaDi3UdZaIEZM2OtE5eFuvozSa1KglngoN7XM1iTe
	TnodHd3VKG+IJhhOm6Qie185Wc0pOeQSj6ZthO3+tgXOOpZ5fR2hiwj40sG3LfuD
	45zVtQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h98h3ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 02 Jul 2026 09:56:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ca3b3141a6so26324885ad.1
        for <ath12k@lists.infradead.org>; Thu, 02 Jul 2026 02:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782986166; x=1783590966; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UnUR1LOesZgE+LhExMMNkZRlI6t8z7VRKCRBzJBUFR4=;
        b=SFZrYxaBC6HS/9jEpSId5bULc2j38r30De9OsWdaEO+xJbJ/qjkt4Oaq+K8V4B5Wsc
         v7ixjh4y83qOP/vVQgaBFGDXl6uysawOCxoRI1/DIs2KjLDob7NLyYjyE6w0wBlpyHkn
         SfKYLqo8qkmC6WwIVbXWVLbUg9gjKCZoJ4ywCySP+44mgJfESmtOsGXL6UwXQm2k8zZw
         MkzKdckZ8PEneWAldnbUswnw7owj25aB9dWh7X58YMtkcuPjjrVs91XFyXmG79hAg4as
         X1/+5AQ/9AVkvZ2zquj1vNe+IonZZ7Z15hghF+rTZfJKv0ozM1ouZRIh8Fk6pkD6VY5w
         N86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782986166; x=1783590966;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UnUR1LOesZgE+LhExMMNkZRlI6t8z7VRKCRBzJBUFR4=;
        b=i5GkYtTTOsl4AuQkvygkkrrTHzqQ5rh2yhOqsfujpFVzsPe47grvEvC8ccUV9yJoR2
         kAWE2oUtW1jCJMMWsW6ThyMOLItjglgcW7MVjdUqYJ4tgikL9n5I7lQdeMiyf0hCa9PK
         e895IG7t+AIY0oLeoxaWYBgNM1q3pMmYrU0FX5DHwXydKV90LTL5EAZHcaaMSaaW2Gs2
         Z85175mly5J3xV7oOpviWYqr1EPuDADzU6rin6sedlccNeiaD9IaPz7W0RODbsMtfoGn
         Jq9DEbHcwdFnjk8ELG/9dEwDnwmptv2iva4zSmnSKL6cc88+X5iE1MP1YCi2S27PFv1T
         Ix2g==
X-Forwarded-Encrypted: i=1; AHgh+RoEe4OZbJD5pyWvphVaHHA3Q5AB4QjxpTaw7TD0x93QuGy98AiilKYhYNwL65znRJJ/T8+rIuY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyvHKPm7N3YcB/6c96PNrvadu7Tb485aG27SxbWhjoZPT2M5ahc
	ZVYaXMEJie/LnVGZxZuS7wyDckmlbe7g+ADTHxGEJpbxAmBh76uM3v/OoN871KicBwsEjP7oU15
	WQyd8AN/Its5igNx+srDtTpwXcLRGUO5p4ff0VgT6MLLgjPybPLt2hJ4spK+MVB8S
X-Gm-Gg: AfdE7ckZ7J270Kme/QFOCerxandtVKRt4JPHWBYod5Xda9CUvhj5C0FnID4T0NV7KgK
	3U5qrD/6/LbKVGRfIx1osi5Qa995+GKILq994YBJk9A54H8NpQoG43HExTEB4Aetdhw8pz0UWgt
	lak53f0gOwWYeQbvbU49bzjF6/45CUF/40ttzkDlEtW6mu5dUhixiGVuGkLCotU8JaPsbrtwZ/z
	Gg4PEc1QUX/JdjNEGxuDFPZ40FQvqJdc3ds7dl8ezMiPPYvzlUhPUVb7U4coCitqza4yLUPpI+r
	BVYHyWuuc/LQKjFgs6Srs92t5Y5pv9ZQj8CotDcrLC4+VUueR3S+tAd9qDRs6BWfy4ydzJup/P3
	qd9dzaRFsG3/utMsAbMcc7RMe2IBVSxSBagEiqbTDdc+qlWClh1rPTPAwbGavLFW82mrcpABAEr
	H0m0+AAZrb
X-Received: by 2002:a17:90b:1806:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-380aa1cad60mr5597216a91.22.1782986165857;
        Thu, 02 Jul 2026 02:56:05 -0700 (PDT)
X-Received: by 2002:a17:90b:1806:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-380aa1cad60mr5597187a91.22.1782986165247;
        Thu, 02 Jul 2026 02:56:05 -0700 (PDT)
Received: from [10.133.33.211] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3810200f089sm138115a91.7.2026.07.02.02.56.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:56:04 -0700 (PDT)
Message-ID: <cdd85c7d-976d-4bc2-8792-bef7e98afbd4@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 17:56:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] wifi: ath12k: fix MAC address copy on big endian
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260629-fix-mac-addr-copy-on-big-endian-v1-1-3de40f74c13e@westermo.com>
 <f4d0c9c0-6d21-4426-8403-209f77ab1387@oss.qualcomm.com>
 <akYkNQTB5DPwzYXZ@FUE-ALEWI-WINX> <akYsszdtJfrvIRSr@FUE-ALEWI-WINX>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <akYsszdtJfrvIRSr@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Z25x-10oEGBdYjNYgQ6HRyfwO1y52MWG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMiBTYWx0ZWRfX/N4jIaIhmjVt
 LdXU0J5J123mjnMMukloSqT+52RTYU+4h8zPKz/i/yHnqc19IDQo5XiYrYQQFQHxmOILYBDddXD
 +muZemqo8ZQNGa6rNXZH+n/HU6LMb5jGAWMyrB3Nc0ow9x84F/CTGdgjncdd04wbm1lHqk1uwSm
 WtcN0dlcKfnqouQCeXNhQBYkKVQNiJZNN8ga7FU/JBKDM57RNkokjpEBGmFB16Ae32gl6Xj4R03
 B1e0NLP3oDcrdRL0uhKmsZzgQN/6WnbPvqz71KCrzCT/EKaCYUkIdROwYAxQvmEKhHuKUNDWH+9
 OPQMRJFhdFwPoGSRPD7/h/GmoEe4F03Kyqjk1T6p6wN9FPzjWK3KqaMqp+KWI9qva0LtFMYfUjk
 HV9EVJcLZM5SvzEs70/Nb7nVU6bB6ZE4sIzwa6Cvv4jh3+haKqn2fWM27xBf1pSlkTWibGP+W/2
 MEk3olAHeqlzoQZ6www==
X-Proofpoint-GUID: Z25x-10oEGBdYjNYgQ6HRyfwO1y52MWG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMiBTYWx0ZWRfX0zQLmr/Bsfag
 D0jRYpFz0WvMHx+VmWZBeHUsMw1mS3jHPNEnghu8kT11WVnCNG75E8tFYXwbGMX6jsmba5InU82
 CNaLG7Fjmst6ZaoyNWH8huBn+uLqopE=
X-Authority-Analysis: v=2.4 cv=bdFbluPB c=1 sm=1 tr=0 ts=6a4635b6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=uj8kP0hEhypoEna20nYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_025608_302144_AFF39604 
X-CRM114-Status: GOOD (  18.02  )
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



On 7/2/2026 5:17 PM, Alexander Wilhelm wrote:
> On Thu, Jul 02, 2026 at 10:41:25AM +0200, Alexander Wilhelm wrote:
>> On Thu, Jul 02, 2026 at 04:12:00PM +0800, Baochen Qiang wrote:
>>>
>>>
>>> On 6/29/2026 3:55 PM, Alexander Wilhelm wrote:
>>>> The ath12k_dp_get_mac_addr function performs a simple memcpy from a
>>>> CPU-native data types into an u8 array. On a big-endian architecture, this
>>>> later results in a null‑pointer dereference. Convert the data to
>>>
>>> Alex, did you find a time to investigate the root cause of the null pointer?
> 
> Hi Baochen,
> 
> I am now running kernel v6.18.26, and it looks like the null-pointer issue is
> gone. I only see the following log messages:
> 
>     ath12k_pci 0001:01:00.0: failed to vdev 0 create peer for AP: -110

what is the actual mac addr reported from firmware in the PEER MAP event? My understanding
is that, without this patch (if we really need it) we get a wrong mac addr, then in
ath12k_dp_link_peer_map_event() we are more likely to fail the peer look up hence would
create a new peer and wakeup the waiting thread. But the log here clearly indicates that
the wait timeout, which does not make sense to me.

>     ath12k_pci 0001:01:00.0: failed to create vdev 04:f0:21:c9:e0:0e ret -110
>     ath12k_pci 0001:01:00.0: failed to assign chanctx for vif 04:f0:21:c9:e0:0e link id 0 link vif is already started
>     ath12k_pci 0001:01:00.0: invalid vdev id in vdev delete resp ev 0
> 
> Should I rebase the patch onto the latest `ath/master` branch and update the
> commit description accordingly?
> 
> 
> Best regards
> Alexander Wilhelm


