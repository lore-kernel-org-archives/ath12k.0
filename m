Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81421606A32D
	for <ath12k@archiver.kernel.org>; Fri,  6 Nov 2026 10:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cQ6WhSN1;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GsE8gHqq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RXvARkbE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8v3tl+9kpgG88CDZ3LlHDDVu3+mvZkT/wB+uI61EvJ4=; b=cQ6WhSN16k6KLl
	k/IVKpQh3jtiXpcmtGMGr01HTLOOBsm1icul6jmgoIsJ9MVORwTE4SgzaRRkIEGTkJK+CIzjyQlsX
	aqfir31j/18LcTvTqXote1SM583v/HqtlRSrq7eokBBhMRaaY629BAkhD8W9Aa6kSpSCHzNSDL6T3
	TRCYFGAEIl2vcP8QlQX7fjW7PqtpDEysxWvtQZsZ7I5LIK4DKPUwB5o0G2p0vPuXHdjfi5YbIb7AY
	2xRQm1Ps1oZ56ew390o2zqD671js57f4Q3uvocTqxdZeVhdsTUZsw1nnfWbl1kYozvXWj96qvn25g
	hI7or6OxoyryM864FizA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHC6-0000000BvrJ-2jdE;
	Fri, 06 Nov 2026 10:29:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHC3-0000000BvqF-2nJy
	for ath12k@lists.infradead.org;
	Fri, 06 Nov 2026 10:29:13 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6AP66L3335289
	for <ath12k@lists.infradead.org>; Fri, 6 Nov 2026 10:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8v3tl+9kpgG88CDZ3LlHDDVu3+mvZkT/wB+uI61EvJ4=; b=GsE8gHqqxysxGZtB
	tdcgj0qPuOhiAAoIN/KHBNd05iHD+JLRPz1JZVtf+Ll0MKCK9N4IQ0G+XcLLwXdA
	JBxIQA6S2KIn0ckcqAgQw/OPZGFkV98rvw926JDHvaVmzuZT8riBekspFW1N9MVu
	tD+pB6SH72icvAozmO0BagqGlMzin98HjcMb1hTQfg6prYXQHSe4ivlvVUFrsMMZ
	0EctaHdZy/xsKGrihszKOHfYJSzowkVnRIkC4VDKDBlIFSufyoZSmXG0Ocw4tVjn
	Nh8TTFyPp8yVKk4eDmPs41/dOTHkynSG2Dvozq6hzoDCCwzUETGuML0nz1dIUawi
	7dgFeQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa2cvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Nov 2026 10:29:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed2803f863so5751835ad.1
        for <ath12k@lists.infradead.org>; Fri, 06 Nov 2026 02:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793960949; x=1794565749; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8v3tl+9kpgG88CDZ3LlHDDVu3+mvZkT/wB+uI61EvJ4=;
        b=RXvARkbEFDIxc46tJuadBd3rqwno7o1FOc/fdM438ArlT0HYcI+NsJQyVaCJKCz0HM
         /AfGYILtJc3BKM2ThscBxzMhvoho7XqPAYdYi45NsGEouNcs9jIsEcPOAnx9+3bCibp5
         gVW0cQVPIVpchpQ2URiRC3T/WjpK4QhLshi1TY+KGcdqTVezkFbyidlYQN+V2XqKsj6V
         dPe74ZbjXCacKJxFb9sfyVKXDOwWhaQj0eIo8lHBmsTX7OxDb2C7GrNuogth+zvu2esY
         V8tbWB+fpjoOv0zamTFv+r/cCv0ZclPtryl7JnsmrwBYN7EX+4M0zkrainE0X5L5mNn0
         zWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793960950; x=1794565750;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8v3tl+9kpgG88CDZ3LlHDDVu3+mvZkT/wB+uI61EvJ4=;
        b=FJApzTU9fE15UZod6RkubpHPWwkeEV5APyTIAbXe/YxSgW8O88wcwvcBQ8x5Gmvkxb
         Qy38u7GEn+NTJ9PAEiLRS7enduqqbdGOtXec8giRcfB0RaBUqsPPa930yi3UrR73aYWH
         jNAfPe2S3PNDUfa+TCfwcZskKej+17yIM+mWsduGYSZvqwvO+qjTmhBcl9qc2CIT56ov
         p58p+D0hjUVJaVDksEWF6vK+9ZqaeCFy1dFyHLnG3UiseYSxeVd2I/pu7dQ/Ehjuas4t
         n8XCO/RCziNXVDF5nVtakYMwqgA71xRAWYpnXS8ef+DN4KPQfBQsiCr6j75qRFaISbno
         UjLQ==
X-Forwarded-Encrypted: i=1; AL+hErFEWyscxWjnM4eVnXqTp9PX+V/J56xbp196p8hX39KWNzza9XSK3xnzFBQd2w0r/g9z/yObkI0=@lists.infradead.org
X-Gm-Message-State: APuU4Z+esBns8sQq9y54RXtX9hx5oxv5yQlgZ9D4jHgqxeg9UguOxz7a
	ehN01U9KL78BVMRxZT4Dz8FL6/ViWYT5Q3gL4XMdQBwuEhwv2J+aLGI05xV8AQAX9wXwgVg/gdP
	4SiPzzfTL1KkyNq3jgAQyK5uDV6x1otGqHlJcqGjyDiydr9l7+sF9Vj2EMnSlutEy
X-Gm-Gg: AYBFou3yb8vHflVphqjF5DtCjLG+jQ8ixra6iuR5fIjiXgyqEblolXpt8DV5nQrQfVV
	vjCh44DO+Y+U49Qp/b5J5BggBZe7LZt/qOoxHnvk8zg6KdFZrPhOddx86qKYFYJR5iRez6uoDOe
	fhjBoYGIsmRqC/IKCOSKAEODr0YYrft9cRXmZObaB+lsiqNbGfuiew5QoKn3x/Biu3kemC7V6VW
	9jCFYsg/Wd9JgP9ekhIBXn48DX409HNEXAelPvWBsj4O30WTTFZ/I/D/S7WSswjXSR1zIadpE5j
	q5dGo8e9C8U0PRaFTOxVybUzkJ8iTfhAGgr4zfQ8YfoA2ytKAqt7ZL7xERd/rGSHnhXnkIYmF3H
	6FR/+1mt1QTuuqOydcwMvbj4jxmfYPaRtXl1L/LzZYb+/W89mCMnLNGz+FTnQyBxiR3bGYHKTdD
	guBY7mSslHBb51va7MICrjk5x2euBaXQNfx/C1r3Va+NxHkw==
X-Received: by 2002:a17:902:ce8d:b0:2df:9057:8bf4 with SMTP id d9443c01a7336-2ed40c7730fmr25500405ad.43.1793960949550;
        Fri, 06 Nov 2026 02:29:09 -0800 (PST)
X-Received: by 2002:a17:902:ce8d:b0:2df:9057:8bf4 with SMTP id d9443c01a7336-2ed40c7730fmr25500135ad.43.1793960949057;
        Fri, 06 Nov 2026 02:29:09 -0800 (PST)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47da1652sm3898885ad.74.2026.11.06.02.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:29:08 -0800 (PST)
Message-ID: <7081fda5-7636-4d64-bb42-545b40957bc5@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 18:29:04 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3 00/17] wifi: ath12k: Add support for QCN6432
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IvaOmwPU6FpODvQel_My1jkN7DXEubIP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0MSBTYWx0ZWRfX3pg0kRkqDm2d
 0yR/WMFfEeIotSTyQpOizzupbgOoCYWDeQIxrujQPuIOwiYY17I5oDyJ0k38veN2JdfDOvHboYB
 OpHMRV7/PwZ8dMGkYglYSw0FxyQw6uLyOd2gu68KJUHDggZ6PejqL5EJagCOt7sUeHYO44bIiux
 evFUQvpUpzKAXLNPt1gG4s2oU1utD74hvL9eyaRcTHVIiA6DIh4ynsbUP/WJxCuDJypYxxGVCh2
 IdEdf/cD9346OG67YSVjunlXrGKJFyECAVk5qWOFQHkgeM/GHCWpTh90hjcqTywMHaKDwcEdFkl
 qJ8I8Agi5H1YfTjOOTfRKJ0UelnxIizH+NsuX4fvl0PbR3Lnwrph3D96ZQ99x2O2ZIf6mhJVVPj
 vp1OlB7FblHU5CKzhQyC+yPgYuXW6jaK6Rj0IbN4xPkE2s6kgtVAl21pn0sdLoGKuFqighWqHGi
 36j8xajXBx2ej+0O5Zw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0MSBTYWx0ZWRfX6ijslIkXAaWX
 nL0iPZEu/vlyfOkczczqiVs3LA8lZgPdImMqGsYYmdTcnnwyCMFiflRlk5EN/EHzzgMmBFPYnlu
 R7Vevz2H6HR7awkxfJsp39APBELGV4k=
X-Proofpoint-ORIG-GUID: IvaOmwPU6FpODvQel_My1jkN7DXEubIP
X-Authority-Analysis: v=2.4 cv=CaKdd7rl c=1 sm=1 tr=0 ts=6aedabf6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=L-72yP8G5ZwXlaZ1uZYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_022911_829090_7EA60A42 
X-CRM114-Status: GOOD (  21.65  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/23/2026 3:01 PM, Aaradhana Sahu wrote:
> QCN6432 is a PCIe-based device attached to the WCSS Q6 processor. It is
> registered as a platform device (AHB), and remoteproc APIs are used to
> boot and shut down the device, similar to other AHB-based devices such
> as IPQ5332.
> 
> However, PCI APIs are used for device setup and register access. Since
> QCN6432 requires both AHB and PCI APIs for its operation, a hybrid
> AHB/PCI approach is implemented.
> 
> Overview:
>   - Patch [1/17] adds DT binding documentation for QCN6432.
>   - Patch [2/17] refactors PCI operations and MSI config structure to
>     support different MSI configurations.
>   - Patches [3,4,5/17] add hardware parameters, ring mask, and registers
>     for QCN6432.
>   - Patch [6/17] moves multi MSI vector flag to ath12k_dev_flags.
>   - Patches [7,8/17] add hybrid_bus_type and HIF operations support for
>     QCN6432.
>   - Patch [9/17] adds support for unified data-region memory allocation.
>   - Patch [10/17] moves MSI config to pcic for better abstraction.
>   - Patches [11,12/17] enable MSI interrupt support for CE and DP rings
>     specific to QCN6432.
>   - Patch [13/17] uses CMEM write for PPT on hybrid bus devices.
>   - Patch [14/17] stores and uses per CE DP MSI data for QCN6432.
>   - Patch [15/17] derives QMI service instance ID per protection domain.
>   - Patch [16/17] add userpd ID mapping per device.
>   - Patch [17/17] adds support for QCN6432 in the driver.
> 
> Changes in v3:
> - patch 1/17: Update the commit subject and change the file name.
> - patch 3/17: Initialize qmi_max_chunk_size for QCN6432.
> - Link to v2: https://patch.msgid.link/20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com
> 
> Changes in v2:
> - patch 1/17: Update the compatible string from qcom,qcn6432-wifi to qcom,qcn6432 and remove the | character.
> - patch 11/17 and patch 12/17: Fix resource leaks on probe error paths.
> - patch 16/17: Move the NULL check before the loop.
> - Link to v1: https://lore.kernel.org/linux-wireless/20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com/
> 
> ---
> Aaradhana Sahu (10):
>       dt-bindings: net: wireless: Add QCN6432
>       wifi: ath12k: Refactor PCI operations and MSI config structure
>       wifi: ath12k: move multi MSI vector flag to ath12k_dev_flags
>       wifi: ath12k: Add hybrid_bus_type in ath12k_hw_params
>       wifi: ath12k: add support for unified data-region memory allocation
>       wifi: ath12k: move MSI config to pci.c
>       wifi: ath12k: Add platform MSI support for CE
>       wifi: ath12k: use CMEM write for PPT on hybrid bus devices
>       wifi: ath12k: Resolve userPD ID per device
>       wifi: ath12k: Add QCN6432 AHB support
> 
> Sowmiya Sree Elavalagan (7):
>       wifi: ath12k: Add hardware parameter for QCN6432
>       wifi: ath12k: Add hardware ring mask for QCN6432
>       wifi: ath12k: add hardware registers for QCN6432
>       wifi: ath12k: Add hif operation support for QCN6432
>       wifi: ath12k: Enable MSI interrupt support for DP interrupt
>       wifi: ath12k: store and use MSI data per CE and DP interrupt group for QCN6432
>       wifi: ath12k: Derive QMI service instance ID per protection domain
>  
>  .../bindings/net/wireless/qcom,qcn6432.yaml        | 149 +++++++
>  drivers/net/wireless/ath/ath12k/Makefile           |   2 +-
>  drivers/net/wireless/ath/ath12k/ahb.c              |  54 ++-
>  drivers/net/wireless/ath/ath12k/ahb.h              |  10 +-
>  drivers/net/wireless/ath/ath12k/ce.c               |   7 +-
>  drivers/net/wireless/ath/ath12k/ce.h               |   6 +
>  drivers/net/wireless/ath/ath12k/core.c             |  10 +-
>  drivers/net/wireless/ath/ath12k/core.h             |  24 ++
>  drivers/net/wireless/ath/ath12k/dp.c               |  39 +-
>  drivers/net/wireless/ath/ath12k/dp.h               |   2 +-
>  drivers/net/wireless/ath/ath12k/hif.h              |  30 ++
>  drivers/net/wireless/ath/ath12k/hw.h               |   8 +-
>  drivers/net/wireless/ath/ath12k/mhi.c              |   4 +-
>  drivers/net/wireless/ath/ath12k/pci.c              | 111 +++---
>  drivers/net/wireless/ath/ath12k/pci.h              |  21 +-
>  drivers/net/wireless/ath/ath12k/pcic.c             | 435 +++++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/pcic.h             |  24 ++
>  drivers/net/wireless/ath/ath12k/qmi.c              |  83 +++-
>  drivers/net/wireless/ath/ath12k/qmi.h              |   1 +
>  drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  45 ++-
>  drivers/net/wireless/ath/ath12k/wifi7/hal.c        |   7 +
>  .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  85 ++++
>  .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |   1 +
>  drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 143 +++++++
>  drivers/net/wireless/ath/ath12k/wifi7/pci.c        |  22 +-
>  25 files changed, 1214 insertions(+), 109 deletions(-)
> ---
> base-commit: 2d57db8fbf72b1872e7411e917166bd12ed5bc98
> change-id: 20261015-mpp-bringup-75f457bef8ee
> 
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


