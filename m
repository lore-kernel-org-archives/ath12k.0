Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18B1C3ABD8
	for <ath12k@archiver.kernel.org>; Wed, 14 May 2025 15:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ABl9jKANhqzzr/vAZe4CDKc9veauV3B8kvEEP2dIxNw=; b=pnazZrpWhR03B2TpLi1r9X4rGs
	1DPd6vSSqzQYpj4AhtcFmmIwZU+ZJ3soOECVSORTlQfuqYTN5Qcbf7iJ579iA46sK8hyh/e9ZTVio
	krwBDn6FYP80dY1rQFR4y0xs5rQ0pCjXzijTbmbI+mnCyMd1KJw/IXNVOIebiG8lFB5KuotcMpRFb
	yk+vuCQ52Gx07gA5WAxD0W+RxjBfKExXddQ8Ojs0NbxOnM9HQpzp/XDhYcvq4cqKs6TFOd05LTpe1
	JZBngDxJTAhufYNSSFVn7NwDUN/WVdJM4eGfDF8Mcjb4eBa0jGXWA+ves5b6VYfbLdyzdiFCOoBWs
	CESX+75g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDwP-0000000FZlM-2Xbv;
	Wed, 14 May 2025 15:22:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDej-0000000FVVY-297O
	for ath12k@lists.infradead.org;
	Wed, 14 May 2025 15:04:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAunU9013040
	for <ath12k@lists.infradead.org>; Wed, 14 May 2025 15:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ABl9jKANhqzzr/vAZe4CDKc9veauV3B8kvEEP2dIxNw=; b=SnyjUgcMMaPiVgCD
	oFEjYkHpDqi8YGI0JNGoBU4cXUMO+e3cN0NJt0WsFLVFc50Kp4bkekl6dleX9Ojx
	VDwpsGFprlflJ7p8p6Wsd9/isRitdV0spJXIgrbgctRdvkeyyAf7cf8JV2QsmO87
	mHgHf1uqoc5DwreAneJ+fCEFHDr9Xt0I/tTUYznSklSOzznR+ZBBh0+/5+V3VR8p
	6Fs/llfQFyzQ1OOjDpK2V5y6K/JtVCqSKtA0KqAthspWC/PR7mmkeafOGBl0z6J0
	UMG8Gl8kYDaunRcAOUgrmnd2lINQZ+sHtRgwUsP/sAWlJEFkB4en82FWxPy6gufp
	Jjo2lw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmk3pc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 14 May 2025 15:04:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22e7e097ef7so57593975ad.2
        for <ath12k@lists.infradead.org>; Wed, 14 May 2025 08:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235064; x=1747839864;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ABl9jKANhqzzr/vAZe4CDKc9veauV3B8kvEEP2dIxNw=;
        b=bpD3wn2GVqhKC+gyvwZFcTKF5rJMyG8yhyivxBXMfkyW5A36E/gxA/H9SiYEt+uvcB
         OiMw2t0WXkaLKi7el6rM6pLZojK4RiE/B9uaDxrHIyaYk1euSJTN0I6QjxVbCfCQL1J5
         r9IUMauER4Y1WptAo/ZGx0Iy37zVFEyzIsFYwVqE8dOzLtw40l8/IoT5hidbB4McrhBs
         2BSI692y1/IuA44eGen7EkPmHjsNJOdDHnLPVkbQp74jglEN40+wqykAJ+7kHegymOo4
         Ly4ooj2ia8uXlnMRk6jaKlKt60ovqcrwNUb+t7Km/taOucdgBIbzcnoOBQ2fnt3U4scf
         txPA==
X-Forwarded-Encrypted: i=1; AJvYcCXjNYWXPP/wNM7rnT2MYwDtJFAEahGe2oetuv7TTK8E3l/Y58/78boggljWfvou2x1RPt+6Jc8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzIT0+FLJlje1hMHkOOqLy5AIMo+Ba8Eb2XBr09PAK9Z56M1vIw
	la+s7I/U6apvlnglafm755YsPFziKskf/b5b/RpJPq+wBNZwDE5DOMgO77IQYjpCEPqBzyB5UWQ
	HiwLt3YMqnTVfEqyiybN1fXj7zFfyx9TG4tMc4+AWB4F4rPlBuB71ATJSWmVE
X-Gm-Gg: ASbGncsyu8Ot61lHg1SQdFoPak8M/BW42zCWRBhPS2xyO+JztiY9lw885tY5fjyHFir
	D7gaCx9D1QjAE2q3oBL/uRqGhCsGy3y9oqkOjfC8HJzZGdlVNuZj+lHCFDbBiW6ueY8Y1hgXsQt
	0sGgocn2IJ0vO5Sw0BLB8RvrxpRz25BTOvsEE/8c2ATWwAKogjC8GdtMU4FVZ4HZwcjDBrXqbYw
	edIpv44ncQWqhCzwIyBw3cILiH4E2sYLUgt6dtWz02mV/rkh96OxIXUx4DpvZi2FU0n0ljNLKnP
	KuOflrU4/nnu8eXLgrE9mvcTUSkS1mCaDwVOBL5MSeRaaj3HppsIVfa6sCFLOntr3vs=
X-Received: by 2002:a17:903:1b06:b0:22f:a4aa:b82b with SMTP id d9443c01a7336-2319813b0f2mr46446955ad.21.1747235063609;
        Wed, 14 May 2025 08:04:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjQ7t9o70lrzuaqlLt1wRe0tTalCwo5HCmLlKoR6bfnHAzYaJQ9Ag3++6SUvGsVhD0BfQ3VQ==
X-Received: by 2002:a17:903:1b06:b0:22f:a4aa:b82b with SMTP id d9443c01a7336-2319813b0f2mr46446475ad.21.1747235063117;
        Wed, 14 May 2025 08:04:23 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829dbb7sm101127735ad.211.2025.05.14.08.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 08:04:22 -0700 (PDT)
Message-ID: <84238fd9-8270-487a-8709-c5d492e81cef@oss.qualcomm.com>
Date: Wed, 14 May 2025 08:04:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL linux-firmware] ath11k and ath12k firmware 20250424
To: Mario Limonciello <superm1@kernel.org>, linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org,
        "Pananchikkal, Renjith" <Renjith.Pananchikkal@amd.com>,
        Christian Heusel <christian@heusel.eu>
References: <96b43d18-72e1-44a8-bf06-6a22fd012b07@oss.qualcomm.com>
 <62cba955-0f4a-4b25-8ec9-065ccfa9e26e@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <62cba955-0f4a-4b25-8ec9-065ccfa9e26e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDEzNCBTYWx0ZWRfXxb5+pv4IpeBH
 gIMX1hUHLElmvqM0xDfIElzUEdWrl+X+3QiFa0KyhtVxBvZoiCtrm74Mdi3xyRSTvh9msaujhBQ
 11elahmzRusNTRVHLFHKH7G/E3YiixAKqZp0bhl8CefdvzwVQw39OpKcAlK4r2wiabg7ZDdFuu7
 Uw6hAZxo5TBSvbS0y+JAd5Q/N1Ulz1Owmt1qzhDyTyzLrJ1wD3S7mgmUYgXUSOMRtHO1NDLFUkc
 U2kXZepgfWUjuSjbPrm6e3HXNae+5RYiCPX0BF/YecFZ+LL9iMfeDPsdXMGroeQCqmIyUAAoeXp
 hdRbNz9SIvb2Kxipf/dt8eY+1d/oEAF0JS3uZo6xGDI0s+Zkq/7hNYd3JqBRhVEXpeIzvDczqlf
 DwK6zvJy/JoKXMf9yDG9pfkr9bBbDiUGhDdC2j8X4QGfaHUSDFWN6TZfA9t5Td4FOpCctWBW
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=6824b0f8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=mehdgkVfAAAA:8 a=KSb9T-wMAAAA:8
 a=PjuYqXk4AAAA:8 a=VwQbUJbxAAAA:8 a=y1C2Jo8pdxxprBwrj4UA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=J1pP9gvGZaT0y92QayzM:22 a=KF4VuIdXkMyp4E_ug72i:22
X-Proofpoint-GUID: lVhSKL4U38z5Fszle4ouKuZn2tAd2Qsf
X-Proofpoint-ORIG-GUID: lVhSKL4U38z5Fszle4ouKuZn2tAd2Qsf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_080425_572033_E4C0C7D1 
X-CRM114-Status: GOOD (  17.65  )
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

On 5/14/2025 7:33 AM, Mario Limonciello wrote:
> On 4/24/2025 3:38 PM, Jeff Johnson wrote:
>> Hi,
>> Here's a new pull request for ath11k and ath12k.
>>
>> For ath11k, update the firmware for IPQ5018 and update the board file
>> for WCN6855. For ath12k, update the firmware for WCN7850 and update
>> the board file for QCN9274.
>>
>> Please let me know if there are any problems.
>>
>> /jeff
>>
>> The following changes since commit 490c0af1d6b9ffca0523edcfad27ba483b9d6da3:
>>
>>    Merge branch 'robot/pr-0-1745490027' into 'main' (2025-04-24 13:46:05 +0000)
>>
>> are available in the Git repository at:
>>
>>    git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250424
>>
>> for you to fetch changes up to ce13d29c3933f77674cf45855668485c48d3eba0:
>>
>>    ath11k: WCN6855 hw2.0: update board-2.bin (2025-04-24 13:04:20 -0700)
>>
>> ----------------------------------------------------------------
>> Jeff Johnson (4):
>>        ath12k: QCN9274 hw2.0: update board-2.bin
>>        ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>        ath11k: IPQ5018 hw1.0: update to WLAN.HK.2.6.0.1-01300-QCAHKSWPL_SILICONZ-1
>>        ath11k: WCN6855 hw2.0: update board-2.bin
>>
>>   WHENCE                           |    4 +-
>>   ath11k/IPQ5018/hw1.0/Notice.txt  | 3918 +++-----------------------------------
>>   ath11k/IPQ5018/hw1.0/q6_fw.b00   |  Bin 532 -> 532 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b01   |  Bin 520 -> 520 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b04   |  Bin 86788 -> 86788 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b08   |  Bin 4096 -> 4096 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b09   |  Bin 2334720 -> 2334720 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b10   |  Bin 269220 -> 269252 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b11   |  Bin 99456 -> 99456 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b13   |  Bin 7072 -> 7080 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.mdt   |  Bin 1052 -> 1052 bytes
>>   ath11k/WCN6855/hw2.0/board-2.bin |  Bin 6429240 -> 6429240 bytes
>>   ath12k/QCN9274/hw2.0/board-2.bin |  Bin 1308544 -> 2626240 bytes
>>   ath12k/WCN7850/hw2.0/amss.bin    |  Bin 6000704 -> 6082624 bytes
>>   ath12k/WCN7850/hw2.0/m3.bin      |  Bin 299660 -> 299660 bytes
>>   15 files changed, 315 insertions(+), 3607 deletions(-)
>>
> 
> FWIW - this appears to have broken Wifi for a bunch of people.
> 
> https://discuss.cachyos.org/t/wifi-interface-fails-to-initialize-after-linux-firmware-upgrade-qualcomm-wcn7850-ath12k/8765
> 
> https://bugzilla.opensuse.org/show_bug.cgi?id=1241986
> 
> https://www.reddit.com/r/archlinux/comments/1kja6f9/ath12k_regression_on_latest_linuxfirmware_upgrade/


yes, the underlying issue has been found and a new firmware will be available
soon. (internal POCs BCC'ed)

/jeff

