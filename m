Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0590FCA0FE7
	for <ath12k@archiver.kernel.org>; Tue, 26 Aug 2025 15:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1//9ar4mn96BTeRcegh7QawnDMTKdyK81gfdwaa5TQA=; b=FDJp68hUCzHipZbslP8r6avFRw
	FBIeyTiUc4I1yk7ZKXA+PAAnnf9hioCpEqvJPvH33anN7vbc3AfkWwWMdwOAx/rk0KavntqGms2Ey
	SJi4/uQr2so9r61Ppo1NQ30MqG+CgH8NTdFXgiHkIxhoZs2wWh31s9L6LFiXZOy/zRpyZJZUhhQSt
	4mQiMDuXjgEvBM2/wpg7J2RT3jLvZ0PDg96xUgD+6BLbtfrUftmbgZLd1UknUZ7sesmpb8PR7k6Ma
	Q8WljBlTfHKGZ7Ce1YEQSttWSnH8Q/OF5QOoOFbDj/aJLUmZUA+oAR4AHHmAYxwMQNfFLDNe5Alat
	I+FBXRew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqvlJ-0000000CTSG-3DXe;
	Tue, 26 Aug 2025 15:39:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqvlG-0000000CTRR-3bRE
	for ath12k@lists.infradead.org;
	Tue, 26 Aug 2025 15:39:04 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QDf7FO031504
	for <ath12k@lists.infradead.org>; Tue, 26 Aug 2025 15:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1//9ar4mn96BTeRcegh7QawnDMTKdyK81gfdwaa5TQA=; b=X4P3LLgHNPk2C2Jd
	5x2qMx8myzFcDvd3GsgCO3pcGV7w/koG/tWWh8qqUqFLDyP4Xd3ZwtdBIaPmaidi
	CONaiwJ1SXb0I/hfrCPY5IUnND3ndfEJ4BbY0/s0gcu3Pdjj53rWqbLM3QetSuDg
	+PTAZVmBdEg58qEPG1qHl+l5GbRyM65DPxZrLo0x7Vj8RHPm2B+DsNnNOpj+WWAL
	nssxfJamSDEvzBJMGG6JfRcIIZ1IbW5tIrNFPT4mVAaU9PFInlQq3qkxyP06VT9X
	WRWT8Y+vIIHPMy4g2iPQf6Erh9HUUZCeuJu0VqcU4h0OTCckdFf9SAEIApRkXmu1
	OkHQIA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se16rd7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 26 Aug 2025 15:39:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e2e5c4734so5746660b3a.0
        for <ath12k@lists.infradead.org>; Tue, 26 Aug 2025 08:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756222741; x=1756827541;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1//9ar4mn96BTeRcegh7QawnDMTKdyK81gfdwaa5TQA=;
        b=dPZqmkAvGwhVe3gjRvp+w60Eg7L7eKs5wfN4GO6TxLTaojzXVzozkryvvbQROnltTM
         59hq6J7FETi3+pBvNbtt8BO9MCY8ojgGXPKBrUUr4BzhSAYkkFdnb431+sMEShnwG7db
         ezhsPTxvdksvsYZ+xP5lBF7FYDNsM1c1EpaCANhlAGdvBh8zd1+Q4z0vKvm0rWUoyGah
         GsuVc0SsxUFPS6HJ+EnCcwx4Bv6NA2TrAD+bQq++BFPx+Jfhn3/LIm++bhm7CCStUDAS
         trnEMsYRiI/++zG6mz2Dnys08RPygLjo8mPkfYr59ssiMfjdrl5Qb306mVH8z0UOm11Z
         HivA==
X-Forwarded-Encrypted: i=1; AJvYcCV0cYmh5JWnpY/G3X/L9wgzPgROYtOTao5e5RCBaGB+5BDYcPQlY6ZQmStF3SIKtAAAjdSuKnI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOE8/CEHXjuhGOLxYxdiZ20WvwBF3ZkI+84M3AO0ZWLSoPP6gC
	/YmQmRaOQhUUpiOq141F3Gdoo+Y3eb6vngMZ/wynbkQMemtTQgJE8DC/CBt2dz9IZqZjd5u3xGu
	hrP3WdOu5tcimLocdrd609X3rYsVfNTm8g1bdvWCb2NuZYnroP4owUX98oi052Xk6
X-Gm-Gg: ASbGncv4O2ATZ7Nn61wvfvjZJeTwh/AnMqjoZUvAQeVIQDp6EoaHIs1YdnEmIytkcCh
	Jrts4F2YwEyDJXljUgcyFWHyoou8oK6RdGn6nn8YvFVO3cI9rR2HYi5qrXZY7bpRAyHKyTDim0m
	UcqC11UI2bjqorWUcMNMFdJvvNDB6V0ynvox2KD+UxB0KrR0Ty/chIn2ZNDzPNexWvjvmAqobXV
	PM7W+493fVEGRCNTqKrwtRJnTinr3Qv9Gs3+Qx72AlInitJTX1/lNVOvM3Oo0XXsySfaKuMxudF
	YVBDFfqK7L1Y2ZeHEiG6VajJWMCyhHnpTbjrbAdboueZZdZMrOGa62ibxr2fY08clbGuiSPQaI0
	21wLN/7rrs1Tb8zFovP0=
X-Received: by 2002:a05:6a20:3d12:b0:243:7cff:6251 with SMTP id adf61e73a8af0-2437cff65ccmr9026053637.26.1756222741338;
        Tue, 26 Aug 2025 08:39:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL0KSG01yve3r3qzqiKchOxZo/p+aKsbAcVtQItkNd7vJ4cyfMgvyDRPq539k48rr7cMjN6Q==
X-Received: by 2002:a05:6a20:3d12:b0:243:7cff:6251 with SMTP id adf61e73a8af0-2437cff65ccmr9026009637.26.1756222740816;
        Tue, 26 Aug 2025 08:39:00 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7703ffae973sm10724369b3a.12.2025.08.26.08.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 08:39:00 -0700 (PDT)
Message-ID: <2fab10a7-8758-4a5c-95ff-2bb9a6dea6bf@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 08:38:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] wifi: ath12k: Use
 pci_{enable/disable}_link_state() APIs to enable/disable ASPM states
To: manivannan.sadhasivam@oss.qualcomm.com,
        Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Nirmal Patel <nirmal.patel@linux.intel.com>,
        Jonathan Derrick <jonathan.derrick@linux.dev>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20250825-ath-aspm-fix-v2-0-61b2f2db7d89@oss.qualcomm.com>
 <20250825-ath-aspm-fix-v2-6-61b2f2db7d89@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250825-ath-aspm-fix-v2-6-61b2f2db7d89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: n6p3QU7yC58MkEZI3QAVAV_ZJf_5eJ_C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfX+zjugaaKleWg
 ELPvqJy4B2Ui5P6LySx2y+wxiNnkKvxMwYQoDUO5xNX5cHqiml5DXsne3SkzMwBT6VCDUtdmQDC
 LeRURy/elDRiXS5h3kLrsxJD+fdzfLlwLJJaSUVFwX//s4IXcjKRR8nzTk8CDM48H652j0hypOP
 +MzYUllJfXNy3bBtQUVOUQZ6ABhXGYJIC7kka5bMwS/tGVdxf9NYaUTcZK0GDsnOS+BRJxixUyE
 BO6BggJx+URd38aliNEm2X9PwEw0fkR+xKxwI9YCSudAZxYtQJTLvJjjX49Hap/mwteIZ4ARFYa
 e+fyrkmhPszn63mq6+5/faLD2B37TxYVdVrRENj6jb4i1FuPLBzrjvuWSVOCVrKG2uRqCyCE78s
 c4LF0j5l
X-Proofpoint-ORIG-GUID: n6p3QU7yC58MkEZI3QAVAV_ZJf_5eJ_C
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68add516 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gMjHX16tY-KYiP7tJ_8A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_083902_908327_B3E11AB4 
X-CRM114-Status: GOOD (  10.85  )
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

On 8/25/2025 10:44 AM, Manivannan Sadhasivam via B4 Relay wrote:
> --- a/drivers/net/wireless/ath/ath12k/Kconfig
> +++ b/drivers/net/wireless/ath/ath12k/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: BSD-3-Clause-Clear
>  config ATH12K
>  	tristate "Qualcomm Technologies Wi-Fi 7 support (ath12k)"
> -	depends on MAC80211 && HAS_DMA && PCI
> +	depends on MAC80211 && HAS_DMA && PCI && PCIEASPM

As you point out in patch 1/8, PCIEASPM is protected by EXPERT.

Won't this prevent the driver from being built (or even showing up in
menuconfig) if EXPERT is not enabled?

Should we consider having a separate CONFIG item that is used to protect just
the PCI ASPM interfaces? And then we could split out the ath12k_pci_aspm
functions into a separate file that is conditionally built based upon that
config item?

Or am I too paranoid since everyone enables EXPERT?

/jeff

