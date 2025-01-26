Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909E4C0218F
	for <ath12k@archiver.kernel.org>; Sun, 26 Jan 2025 18:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vSa3nfXQM2xePYgrf7A8im9wXwMSfacRsv9VAHoB6w=; b=kCVQBC6DX3iVbuDghFXKhA4ppH
	7L3AOWkE8PpZ/+OFb92gD6EXlyDQuyjCkT06em7wnHEsX6Q/F/jWQAMedUcKHdlMPwFsIyDpJOlVq
	GlwAw2Z3mn2d/bkyvKyeL23bFSmiHIt1F+ml5AkzFTtddx6ME22FGIP3lcePIwXAf8svrR6cqxUsw
	s2ThB6pXvMhC6FAfnHKe3iiosgKCjL+dli04HNzyiCYMxheKZf0YTQ4H//BN2y4VI6z0I7kSUGL7m
	+/F3N1A/6tdKqFY745+o+e5SyQdhOixPHGGG06LjwKUBSNc3r0+9HXhaOsX4Vd4uiMYjDZANQ0wHt
	/I+R7nFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7d6-00000000ex3-1JbD
	for ath12k@archiver.kernel.org;
	Sun, 26 Jan 2025 18:45:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7d3-00000000etD-2rLe
	for ath12k@lists.infradead.org;
	Sun, 26 Jan 2025 18:45:06 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50QIiF99013959
	for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 18:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+vSa3nfXQM2xePYgrf7A8im9wXwMSfacRsv9VAHoB6w=; b=H4d/JuRjMC52Z/z/
	5ladWzJFEek1eviZg4w4bOJd0w1TVEDN+7vZFX9+0LNPO3miTI4NoKWg6vy535eS
	XgwXA/3fipNvIeX9qxm3ik/oUD7SiRY7TOv/GFSTQyETQYAkqg2giuPuiQn8OHdg
	FKRGzTJ8ncsmeuvCMS+jRXpLouLNhYiDCfBITlmnjkuPYVcAxkoEfcaFbBIuXOmq
	zgd+5JYrM+42e7JBopEqqUxSCX8jT21dVyy7RSIqHvls01NW0ruZXrVkpmcr2joa
	ZNbZVHuE0/mrBMcSaly6u57hlSN9DFW1gydjJVXlUlsPZzXwv4si2MK3mkhDziPW
	K55F5A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44dgj1gnba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 18:45:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2f816a85facso1100018a91.3
        for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 10:45:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737917104; x=1738521904;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vSa3nfXQM2xePYgrf7A8im9wXwMSfacRsv9VAHoB6w=;
        b=S9R/Ptr0S1mHKHdFlThjjWZ+GO0c8D4ruSjvAL5aj+g+35hNxuMisV4JCDCUV7SWt/
         ecoxXGODlnpjnhVi95JNAIi4rMdIC8nfxjfWiBwieEvuBbEMHQ8snAUpoYaJ8mrXcAST
         Wlxb82JPPVq2neKvdC7fXXnYlNInV+Lc/7ruv3zgGNGy0nywHsURD9q83sIPqPkOJVmL
         opm8E+ehQXXkidtrVr0DaNYcSPxysoE52cqjfZ+zjD+IERylgGhAROWg0gdX2GXmti8A
         H1JDwt7K7mv5yn3MOX61SeH+py13HPtDS6SvG7kyEp1pHDQYRuHxW3NMT+Utmu/xetN3
         k4NQ==
X-Gm-Message-State: AOJu0YwSlLD4hEebstaPzuqmkTkZ6GpMDHNBAwPnmp2R3X97fiT6H7SR
	x6cY5tpvA2IjjqEEa2KEPCbWMEbzxXZ946iO/uBZyooPTV4/J4cpVuQd+B+cBUqVFOchMywEBOk
	NvxLnQ+9k8dX91kvXxEsqWrnPUH1Wt77ya235lLZjvVqb/iSHKZ8lO+Hrf5Sq
X-Gm-Gg: ASbGncsj8q7jwY6T/xt2EdCeqeGTtgNu+DM8U5fiHlaRwT04ltxXQxcT8vYwlGv929T
	Rdz1ooqUFj832vYWYaR/PkZ7jbDjtxkNF2OMwdP9VxbrtpCjlyJyCquTLtw3TXmOQmVVHXxtc8i
	rl9tI7sSAvAvLYd5SZscEsZMo2KJB1PDK02zaGy2uryO9eYWORqWiSlZ49Mb5l3prbtI072ZzIs
	dQ1kQtU452Ask65rvH7kIejutBg18/WaRPHkhICkQwewpfBDqaWrUz3T0tVAK2gyWt41zIatGRd
	InflsU/SaOO+/RidSqT80jDvso3Hw5Y5351uf8IlCg==
X-Received: by 2002:a17:90a:c890:b0:2ee:cd83:8fe7 with SMTP id 98e67ed59e1d1-2f782d9ee9amr53256512a91.35.1737917104280;
        Sun, 26 Jan 2025 10:45:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYp1/NPq7KY03nXtTrPdG1e7aXLBtD7LtLJ/4nRK00/X/uIr69KBAlpimtGYwVLGjFHWxiHA==
X-Received: by 2002:a17:90a:c890:b0:2ee:cd83:8fe7 with SMTP id 98e67ed59e1d1-2f782d9ee9amr53256492a91.35.1737917103922;
        Sun, 26 Jan 2025 10:45:03 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa44cb8sm5414795a91.6.2025.01.26.10.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 10:45:03 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: kvalo@kernel.org, quic_jjohnson@quicinc.com,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
In-Reply-To: <20250123080226.1116479-1-quic_miaoqing@quicinc.com>
References: <20250123080226.1116479-1-quic_miaoqing@quicinc.com>
Subject: Re: [PATCH v3] wifi: ath12k: fix memory leak in
 ath12k_pci_remove()
Message-Id: <173791710277.2935553.10215437137519428295.b4-ty@oss.qualcomm.com>
Date: Sun, 26 Jan 2025 10:45:02 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: gpUHvhG0patKjSqfEszUJF7DUtW6Sj1q
X-Proofpoint-ORIG-GUID: gpUHvhG0patKjSqfEszUJF7DUtW6Sj1q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-26_07,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=750 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501260152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_104505_727873_FBD6254C 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
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


On Thu, 23 Jan 2025 16:02:26 +0800, Miaoqing Pan wrote:
> Kmemleak reported this error:
> 
>   unreferenced object 0xffff1c165cec3060 (size 32):
>     comm "insmod", pid 560, jiffies 4296964570 (age 235.596s)
>     backtrace:
>       [<000000005434db68>] __kmem_cache_alloc_node+0x1f4/0x2c0
>       [<000000001203b155>] kmalloc_trace+0x40/0x88
>       [<0000000028adc9c8>] _request_firmware+0xb8/0x608
>       [<00000000cad1aef7>] firmware_request_nowarn+0x50/0x80
>       [<000000005011a682>] local_pci_probe+0x48/0xd0
>       [<00000000077cd295>] pci_device_probe+0xb4/0x200
>       [<0000000087184c94>] really_probe+0x150/0x2c0
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix memory leak in ath12k_pci_remove()
      commit: 1b24394ed5c8a8d8f7b9e3aa9044c31495d46f2e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


