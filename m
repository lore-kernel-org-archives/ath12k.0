Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA39C87FCB
	for <ath12k@archiver.kernel.org>; Fri,  8 Aug 2025 19:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ietVSNFUdjg+Sjq5vTWe/PgHDfKOkPAOEy9CJqyKx6w=; b=kntFRfFWNrVBpc8abZTIew2nm0
	SVcM5E6G/V1xD9b4LtMOd/FnKsL+HAhPE6LnxhtG2kELEilulFr3etwQOMYsc/TMOGkPwMRDzWCro
	QoLP0fjOh/pbKpX5ssRTyWj5HOrWFw6YUc/ImYcRDNBWty9ZUknBb7raII2tW8sD0ii7fpO12xEct
	Z1AjqMXzxV9AxOwulekPyXuJwS9TtmGDW2y/gdAYWbXCtapB/3ExE9hd7OeiocZkRDBa5hgREEco0
	LANoMJ8EjwPF+HbfPWtYS49lqWuLu5k8C9gPx2SDoEprieHvVSWghPqEWp9Tv6MroetO0gvNTDnVi
	K41CHsIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukSNk-00000003W1L-3Kbr;
	Fri, 08 Aug 2025 19:04:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukSNi-00000003W10-3GE9
	for ath12k@lists.infradead.org;
	Fri, 08 Aug 2025 19:04:00 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578ElWKd007839
	for <ath12k@lists.infradead.org>; Fri, 8 Aug 2025 19:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ietVSNFUdjg+Sjq5vTWe/PgHDfKOkPAOEy9CJqyKx6w=; b=WkXwFZ7FbNm84+2K
	ML1PugjddeRW8CotuUg91gyrRifBhJR36y/9suk10KM4KLJwdzURCC0ibVN3cEoS
	YdQ2QqCHzAG9Murf4XLo7WOPm+cmv2yJmDrRg1tLEknVNfNv+FAEXdEWAopa1Xdq
	JWm04iNNKh+aWlxs0FVOfDnrTBTMNKppk71i6UqbZYkMIyZckNvA8BGQML3xJTjo
	T/LP+0KZOsHdv7THGAMlTP0eE89IUUa4+JSfVgA8vDIA+l5TxvVslH4mZKxvkerU
	fYuhTsW4edpZD7g0QmbqJopTHnTfpX6q0RS9/r5FoDwfiL4XIQLnab9VH8JUYgHm
	fwholg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy72ycr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 08 Aug 2025 19:03:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-240012b74dfso19225685ad.2
        for <ath12k@lists.infradead.org>; Fri, 08 Aug 2025 12:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754679837; x=1755284637;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ietVSNFUdjg+Sjq5vTWe/PgHDfKOkPAOEy9CJqyKx6w=;
        b=l7ujaqWoo7Q49J+0ZIlySALCJhwZ97lj3rmj/aR4ip2ReAgU30+UmGUb6MEOOxkvxs
         VOjNo31ffHzz6+gbtBqnin3InLBJvZVCb/rf55pZYkGL7LnomTn9G7UYAUK/NhKKO7MA
         V0nFqVpffbMvV+22NVzdVL7CSRn3gzKaanqWalGwibaahwmLnckXhSn38ABpEK9hDGfA
         fmiWtgcG/656UoWZXUmlGaHBhSSXfQYd/UzCkwtQJKEB3f1FZHdY/E9fZS+GctPqUttR
         vhTFnCMT/oCsPEgW8U/0cWS8jO8ZvxFYguh8Bc5EXFsEErmEWl6a8nHf5PiCpQlqy+PM
         Wlgw==
X-Forwarded-Encrypted: i=1; AJvYcCVGd9TJabG/i7QbMsDFUlf2ZEUXLimC/0Hu/tEsQnOmCFiduOIcfsM6CF6KyqMsWiy1xJz11JU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxfTzae46JExfRarDhqdh4LkbUKX6YT95yCLBJ6lREgn6eKtlIT
	YMVbJ0Cn0Cuzsu04yIccKs3bqEs6mT+QZuE9/maFFRplPyzEK5ZqyF4NJiZwOhvBFMMRDav5AmO
	QUUxeDpytX8PHL0MeFn59nC4mlymSvPfz5tuICx10r123y1RJP+UffiF7AyewxhxI
X-Gm-Gg: ASbGnctICbhr6n3ub+Z71PyU8mHjVvYof1WO/WMYQVH8i5kA4qw63dcX5HhxxRqWNBy
	Ec5ojc4oOjDY9C/p97Z6KJxTYlFikXyQQrF8d0o3dksW5rEAQHG9pbW+ksGcWFmFUknuie9p0qQ
	ZGkZq/gAeQtDkQ+2+/KzCL5gj/mSmd0Dkw3jgNyCwI68tFR89TxUzmfUwYi4YpLYtbOgmQRongn
	yejObOFDWlBdmO7XgJMqufUgB/q1gDlvXeQuBdixZzCAgsjTSzsEIDlCX4Q7C/7SAb8wf+mK6xm
	SKLlDBMDVRBlrNWHcx9zE0D6HI5NKIE8TcE8W1yokXFwy/O6jJeIM0lq9nQpq64OTnFFknifFvB
	Jx+ZRuU+u2IqDznZcIjyGZ/kImeXe23ei
X-Received: by 2002:a17:902:d502:b0:240:3c62:6194 with SMTP id d9443c01a7336-242c2003cdemr60832445ad.20.1754679837446;
        Fri, 08 Aug 2025 12:03:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA9MH03pd6NIzYG1JX4hKKU/R+CO8e73Q66m1dXTZ4Wn8Iih8hKQP3ssl8Wranq16Ogba7Gw==
X-Received: by 2002:a17:902:d502:b0:240:3c62:6194 with SMTP id d9443c01a7336-242c2003cdemr60831955ad.20.1754679836936;
        Fri, 08 Aug 2025 12:03:56 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef5fbdsm214361645ad.27.2025.08.08.12.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 12:03:56 -0700 (PDT)
Message-ID: <90d4ff1b-0cd4-4947-9b40-131e3ab1e83a@oss.qualcomm.com>
Date: Fri, 8 Aug 2025 12:03:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: received scan start failure event with the last two firmware
To: g <gregoire.s93@live.fr>, ath12k@lists.infradead.org
References: <AS8P190MB1205E00E68B9DC98DEBD7CAC872FA@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <AS8P190MB1205E00E68B9DC98DEBD7CAC872FA@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lNceXoheECZGK8Nn_PXP5mTkTOWgogPo
X-Proofpoint-GUID: lNceXoheECZGK8Nn_PXP5mTkTOWgogPo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXz+3V6D7JTTUb
 eWcegBeDRcydyo/fcLEU3e62mWphvf/e1TG+zKtqNmJdnQevhHatyVyhgfE1pFZsizB1ilYzbtg
 2gllrEr89MOs8wvzmuCwfnKSiXpN4EdvmBGy8qjyI9zvJ0wfjBrqa0S5YNmxThVm9tAA4uYPOBO
 k7rtuijO/BVmusE/RkQSACNUWJv3JozCIKZH43NCjIjLGjCclnX6JnmG9+2gFxNUN8JJpWWU2ix
 ENhdZgpfzPfo5pq3Lk0tgAzaUNqBjV06n8pmp91HCKGsStxjjTeHb3ZeT8pa5pbtb4dyf0Tk+v1
 WzdksBjxtxCo8UV2lVVrB4frqG38GnZercS3rt7LmDUU8MCYOelL2IeO1rLYS6nxkb0rIElqYHF
 haVlR7p7
X-Authority-Analysis: v=2.4 cv=LNVmQIW9 c=1 sm=1 tr=0 ts=68964a1e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=H_VxmGiCnkVkl2j89fYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=eNH5niYpQkIA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_06,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_120358_816372_B1B98E74 
X-CRM114-Status: GOOD (  12.11  )
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

On 8/8/2025 5:22 AM, g wrote:
> I’m seeing an issue with the ath12k driver when using certain recent 
> firmware versions.
> With the latest firmware, I get the following error:
> 
> |received scan start failure event|
> 
> If I manually restart the driver, sometimes scanning works, but other 
> (most often) times it fails with this same error.
> 
> Affected firmware versions:
> 
> - |WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3|
> 
> |- ||WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3|
> 
> Working firmware version:
> 
> |fw_build_id 
> QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3|
> 
> With the working firmware, scanning and connect works every time.
> 
> I am currently testing on the very latest Linux kernel from mainline:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=37816488247ddddbc3de113c78c83572274b1e2e

Can you create a Bugzilla report using the instructions at:
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/bugreport.html

/jeff

