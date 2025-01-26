Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F682C0218D
	for <ath12k@archiver.kernel.org>; Sun, 26 Jan 2025 18:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YEi90dBSutM5+pyI0Txt01cUBPFMzvcO4GSGRYl8W4=; b=o0qbI9dK1MXTadNDEsQ7pX3yqx
	bLlT2z4v9HvG7m2DgC/+Fojlp1QZTq/4mhvtebd4IwDsf7ipQjiUVlTFRs7hjHiwyZyvVY+mThzD7
	4ZZBo2J2ST3Dl2l6cFR4x6n9+gVmWj8tnIJi4EZrXIAacmpilMsQ2h7oOwgmkzeDIzNpi8d0cgh2Y
	/r1/gVMhyeTQsLc90M/kYWKX6BvH4XQypIG+sDkl9zhFkxT0mPqiJ4+/5+WCsPD1acEZtrcyUXr5t
	XNNAY6JvoJRNTNUSgEQhT0ap/OIeLOhl+i3rx/2TynKVZUQEgDFigFMpw34m37H53bqFhMXfKiFeG
	y6Nz+NAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7d9-00000000f0v-3xCF
	for ath12k@archiver.kernel.org;
	Sun, 26 Jan 2025 18:45:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7d6-00000000eva-0Q1y
	for ath12k@lists.infradead.org;
	Sun, 26 Jan 2025 18:45:09 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50QI03Kf029011
	for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 18:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6YEi90dBSutM5+pyI0Txt01cUBPFMzvcO4GSGRYl8W4=; b=aoRUCKTfR5GRKegn
	9UIRD1VCRlR0gaWnAd2ODPRfeaGbn+RNXfk+XUAHKOWCafaWlf85V9t87p8Sa19B
	MQsTpCeqy8hKZ45FaBoAKrbU29aV6cOSB89I/k/bxAbAFFRQwRYRWCFZYuyO+X9p
	ioRcNbSbM83eqZMR/ArPUs/2B6VxCF4qSWMH4fBoT5Xx/+KkySF/GKwcswxwMK91
	fjN/7bbSU0nxDCJDsWlj0a1XvVRAfYwY9Aoi9gbm4wMfCZbju4fOdk45/yjO5mAv
	y9ThvsJbewvqQA5yx5QWRDjv/E9T2PkdFNq5Kw1Anjui1FFfBg+7tneLv38cDCwG
	lrXtIQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ds0402yk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 18:45:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2efa0eb9dacso7373664a91.1
        for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 10:45:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737917106; x=1738521906;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6YEi90dBSutM5+pyI0Txt01cUBPFMzvcO4GSGRYl8W4=;
        b=GtgjvEN8jpcq9tBlzFpwdG8Fsk4ia4uvAVH6eGxsso7KpMfQ9NUVnJmtlgw0syjtVb
         3VkhXYn28WEBlfZyJp//On0U2QYXh5SMK3nE6YcGdd+EBgfwBvSdyobdi/SPfVw4LWmR
         OF1Z61U2aFYOx1GsDlESX6LrhdtUE/axcahietiRB2qKM4s4kT0EXgySFsVuph2X13F0
         OSJhaY+rjvvs9iQ9lIvUdfa15vUiBJqVnZXJXcoyQ38+SRqLMhRY4pGnD7rcps7DdWg1
         Ft1WlLsW+zgYMGOlW73uYIZsblT8+T0eFGIPjO+eF6I53Z+TvwYcx1ENHg5L7j4Ob+Zi
         gbng==
X-Gm-Message-State: AOJu0YxsNwS6T7m1PCuYfHBanaosJm3EKiiIpNcJPVhWhQ2Y2UakWRRU
	i1LfFvQ4LH7GMdawdAQrDMvypEGsW6krXWPcPsVLMYG78yQzzZy1+8kMZjEe1KjkkRGh3TdwRHE
	ab8n8NhJvXrB0b29plqmV2WYk0Cf66seMkKe2TLYwe99BmqgoD6WivGP8vR8dr486GHIn
X-Gm-Gg: ASbGncuwvWWVDVtHArZ+OSxT+nUsMAHYZuAjcdP1wt5M0JLuwh6IUb9uvQ9ZdVyXmxf
	YeB8dBdy4Su/ljG9GANtswaU7CvzONwhrsWtNDykRCniv1FpTtqoL4MK8y70eV+EeIqcdTrVb4U
	YbHSot9fqN/W/u60rcKl3FZcITxOvXH1KbiIqOf9kkfbxZc5zEJShWllPDR1TInCRoFKtSeFGhM
	Zxblja/LahfxDPGvnMW2T6CRGo9BBoTTKnKQQ26IBo5uLA/PqoMuRUhr7rls41RTkHlfqqkedLq
	8KpQI++83f7KR+uZXrkbT2ywXJmJ7Rw9EJWBDC6kAQ==
X-Received: by 2002:a17:90a:e18f:b0:2ee:acb4:fecd with SMTP id 98e67ed59e1d1-2f782c70244mr55952262a91.9.1737917105723;
        Sun, 26 Jan 2025 10:45:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2dz+GvJPSZEp1N+EK0A5D27qalo50XPx0nZr0r4hAXXnvmC9ERXJ9RbzsFNSgGdLvsZ5w+Q==
X-Received: by 2002:a17:90a:e18f:b0:2ee:acb4:fecd with SMTP id 98e67ed59e1d1-2f782c70244mr55952239a91.9.1737917105350;
        Sun, 26 Jan 2025 10:45:05 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa44cb8sm5414795a91.6.2025.01.26.10.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 10:45:05 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250102043048.2596791-1-quic_ramess@quicinc.com>
References: <20250102043048.2596791-1-quic_ramess@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: Fix pdev lookup in WBM error processing
Message-Id: <173791710479.2935553.14678906520779985511.b4-ty@oss.qualcomm.com>
Date: Sun, 26 Jan 2025 10:45:04 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: LObv_VgUU3xY5s6xmprzp8WS1kbF7eyq
X-Proofpoint-ORIG-GUID: LObv_VgUU3xY5s6xmprzp8WS1kbF7eyq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-26_07,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 mlxlogscore=873 bulkscore=0 phishscore=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501260152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_104508_282965_35F1DCB2 
X-CRM114-Status: GOOD (  10.47  )
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


On Thu, 02 Jan 2025 10:00:48 +0530, Rameshkumar Sundaram wrote:
> Currently in ath12k_dp_rx_process_wbm_err(), when processing packets
> received on the WBM error ring, pdev validation is done based upon the
> hw_link_id. But hw_link_id corresponds to link id of a given partner pdev
> in a MLO hardware group, and is not the correct index to use to lookup a
> pdev in an SoC(ab). As a result, pdev validation fails, and the reaped
> packets are dropped instead of being processed.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix pdev lookup in WBM error processing
      commit: 4e635b81db9d69bbb836afae8cb402978ff966a4

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


