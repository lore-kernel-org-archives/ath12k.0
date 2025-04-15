Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5448C369AB
	for <ath12k@archiver.kernel.org>; Tue, 15 Apr 2025 18:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+l2W10y/QDYItzPC6zPbHSlvs3nstb66aVexkh8d8Vs=; b=PGppAmzHWkLLqQKqVTZV5VR+d8
	u4lvTLTVFxnJlXy7nn8KiDPII+7gfch7tUGWobPaQ60M6obk8WAEtT+ZUL1ikDcfftzJUS89F/T7r
	xzXhNJI+gQJe1Kz0MW2QTj6VxzHJ1DqxwrhC/QY4i6Fwu9+63i+dd+ARsQCxSG5ppOkAW1I0KDPZW
	3ep+3wIQbrkxliJpbwCb5jerjfDvabhHtmg9kzdXMxk/NkFP1yRxd0RSbLu7uIdBebNg7jN5vYSWl
	iPPjuZa5v9YwmBiDSaoWZEp/OWl75g9hruRIsFiiba2V2q2dwEfJaS8E997hDko2gftWXBT/lAT7E
	jk2uXDnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4kaR-00000006epw-1kdA;
	Tue, 15 Apr 2025 18:00:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4kIW-00000006bp4-0vQx
	for ath12k@lists.infradead.org;
	Tue, 15 Apr 2025 17:42:13 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tDM5025102
	for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 17:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+l2W10y/QDYItzPC6zPbHSlvs3nstb66aVexkh8d8Vs=; b=Pq4YL8EALfw2uEzt
	wQAQe8an5esLGDdKqSLTxs2xVTmOL0VJ0cRtLDGAm5nNQk1g+zHjF96f4jOBZmJu
	nTbTwRIfMst1yz8AC+6a3I7xmEt9ivvW6f+WHUUWfo17yYsbr6bJo9Qbsd1TadU3
	qzpqB1GL/i7lTMn+xq5+SPIaj3RqZgOs0peXiHj43W0Yv8Via14igsEfLmXnsvis
	vCyLXD+fsnSeD9X5vqc9br38I0/cBONKO9SjUoyQNn8HutozzuNrpIKUdssPWaUP
	BD3cclKC2I9jVVloV+HsAzDdNdh/mgFQjkRSfOtbNM6tFl4pWbLGDmrviojF2OiS
	pLITFQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wgyrh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 17:42:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-306b51e30ffso4998548a91.1
        for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 10:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744738929; x=1745343729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+l2W10y/QDYItzPC6zPbHSlvs3nstb66aVexkh8d8Vs=;
        b=PFjgfls2E6tQql404CFdlYmauZpRLxlHxWi65PzM5XGZKVlIRDSPpUIs6AlAeY6WnU
         z0j82Sv+DzL05Vg12Nk3tuaFE4edGGbv8YA78UTXAu2JjiGt951RLBv2rfPcd0Ny9Mnq
         zz8zXrjyp7xS9fc8S8Vw9M2IHJX6+s3vvXzJOUgi4HTiDasSY3cxQW0sIPkZnCP2DtzK
         6uA+G4Aa4KmXdEQqzafGRgfNosuARRkdP4zHjVL6ovDYWw4+TP/zLh/iE6KoyaB+jZWR
         Ml5eLk/QZCA+DFJNMibTLZ4g/Ps2Bg2w9dmQDQ33zcVjP2eXSWt4yV4FV1VGDe5Cn9Me
         zuZQ==
X-Gm-Message-State: AOJu0YwsE6zCbkRd+r2UNDuqvz1tsb9+kfWTZL8TpmJ//ElpUz6Mkjcd
	tx3silr4tI9BYv/quZWiwx+0Mt74SomTXV+VswUP7J+7HSEO1T1X/V80lOhrUv08HkgynvVnoGf
	MkaKgS5iZxRfXBMcJ+YREtUGh8zCftUEIYp6Xl8WLqN14KQnAlBpxK3/ScqAECy+6e0tO
X-Gm-Gg: ASbGncsG5obgo3lUVk0I1/NxO0rRH3SDRnD4GQ9mteFzd5Jsp5ElXm04cPk4gh2xL2i
	QPweTxFSru69NCaVu8+Afihf2yovebdniM0lICcgT+y58p/zLjrFS+pqU6tJrP6uaNkmJ2ZSo74
	4cwJ9t1v2f/Mg56QA2bItDqiCWJvJOkTP0bqWd050jvBdJ4pOM5c7G39rol2vin9HdrwEmr+gt7
	XXCqnRif/63wfco7Ur+nwlTpw7GWJNUvVCX98+qI5CH3HJVNUDSTbvt0fEtY+ZKJzHXCvvd7Hzm
	c3OJHp5J07AHnYCrG8vPSiDifUMTrj49LVQ6FODYRBc8H7F7+G8pA5rDkxMbXHC4kX8=
X-Received: by 2002:a17:90b:5188:b0:2fe:80cb:ac05 with SMTP id 98e67ed59e1d1-3085ef076a0mr38632a91.9.1744738929389;
        Tue, 15 Apr 2025 10:42:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxjbyZltG3a17wFXsez/DYC3bIiRyst3wDQCr7ODZkdqhmIHOOPryE5s12rmU9eaY92ehfZQ==
X-Received: by 2002:a17:90b:5188:b0:2fe:80cb:ac05 with SMTP id 98e67ed59e1d1-3085ef076a0mr38588a91.9.1744738929015;
        Tue, 15 Apr 2025 10:42:09 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df08f826sm13443504a91.29.2025.04.15.10.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 10:42:08 -0700 (PDT)
Message-ID: <d25ca9c0-64cf-4edd-97f7-d82a71e32eb0@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 10:42:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: handle scan vdev
 consistently
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
References: <20250411-fix_scan_vdev_handling-v2-0-b6740896c144@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20250411-fix_scan_vdev_handling-v2-0-b6740896c144@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fe9a73 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=tjBKq9sULpQLctw1ybUA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: E0Q3Rc8Lj7f2K94N7X32G0rdcsj7K--4
X-Proofpoint-GUID: E0Q3Rc8Lj7f2K94N7X32G0rdcsj7K--4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_07,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_104212_388225_723494A6 
X-CRM114-Status: GOOD (  15.85  )
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

On 4/10/2025 8:16 PM, Aditya Kumar Singh wrote:
> This series of patches addresses the handling of scan links in the ath12k
> driver to improve consistency and functionality. The changes ensure that
> link ID 15 is correctly used for scan operations across both ML and non-ML
> interfaces. Additionally, the patches prevent scan failures by fetching
> link_conf only when the link ID is valid and setting appropriate default
> values for scan vdevs.
> 
> Currently, no issues have been observed; these changes are intended as a
> cleanup and to ensure proper handling. For split-mac these changes are
> pre-req change.
> 
> ---
> Changes in v2:
> - CCed linux-wireless list as well.
> - No other changes.
> 
> ---
> Aditya Kumar Singh (2):
>       wifi: ath12k: handle scan link during vdev create
>       wifi: ath12k: Use scan link ID 15 for all scan operations
> 
>  drivers/net/wireless/ath/ath12k/mac.c | 55 ++++++++++++++++-------------------
>  1 file changed, 25 insertions(+), 30 deletions(-)
> ---
> base-commit: 1a7000fb8348e04ab486513d6ebd4b6074a94be2
> change-id: 20250402-fix_scan_vdev_handling-ef5be452b949
> 

This now needs to be rebased...

Applying: wifi: ath12k: handle scan link during vdev create
Applying: wifi: ath12k: Use scan link ID 15 for all scan operations
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/mac.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/mac.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/mac.c
Recorded preimage for 'drivers/net/wireless/ath/ath12k/mac.c'
error: Failed to merge in the changes.
Patch failed at 0002 wifi: ath12k: Use scan link ID 15 for all scan operations


