Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7804C0219E
	for <ath12k@archiver.kernel.org>; Tue, 11 Feb 2025 15:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lD32Vez99AdokPW/YoVLXROqua1GtCDpnPCVoxnwEo8=; b=fExbXKkEdreVwK+QWq0BX/r6nM
	gcOO4KuuxZG09xUSxynwmoN5Kj9z479b8RmlmaSQJiGlxWK2kVSe3dimhmhPUPHg4Dw0WAIwPAUDG
	p8qxO/Sw3XpFgI1WqVA1rnwXWGjlJeCQMYtWAGdxiUhb5ZH66WJ8MllFLN9UvM1VD8VxYphRfvbhG
	xaQIKq3MvZLIIs8Z65npeqoLJIaKQPHwGcRMUPvO051XUk1UEl7Hwf/D9O4L+JU7LcEvcCEAOlZ1y
	dHhVGd7hi47agUh0z/8b72ijPafsS1IoHHB/qsEv7ETS7K2roYUGGtfiwQBekuAZc3SAf74Ue1G/E
	UHxhOogg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thsSR-00000004LP5-0dbm
	for ath12k@archiver.kernel.org;
	Tue, 11 Feb 2025 15:45:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsR9-00000004LFO-1AsM
	for ath12k@lists.infradead.org;
	Tue, 11 Feb 2025 15:44:36 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BDHuTg011450
	for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 15:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lD32Vez99AdokPW/YoVLXROqua1GtCDpnPCVoxnwEo8=; b=NnJt7UhXQpcAthVN
	FTjbyS7ajMw8Wq2CQ3RCpGKSdauNVmGPe4qHSY1zMFQpSmWgSrmg+uOpS1abLkmd
	dHmcyPmE7Joqd8llO/0wkH4qq2fhSg4JUSe5LaaossSsuFPPuUfixYLmmevHtN0H
	tp4vzYledVu7roOLjTr+7ki0DGgyrs6gmI7R8aiEzBxCHbc6A+7+iEDxopmn8Rlp
	qOBRYL2kUQ3AnJS2OMwZQ5PhzvK1hcsprIQGyE0SMPgGH8qQ3lezOaCf8TMjMS72
	kms1CTsBMaGJYxClZerYw9MloCHkTbC28o87FpVeud7CE8bisV4D1gaXH8mUvERk
	OlKIeA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qxv3sw6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 15:44:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21f3aad4e0bso83937435ad.3
        for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 07:44:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739288673; x=1739893473;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lD32Vez99AdokPW/YoVLXROqua1GtCDpnPCVoxnwEo8=;
        b=t+m3YlISag9OkfEx912T2+F1AWHKe+3VlmfFj2jaZTqE7ohUEt2sOXNdd/b222HYFE
         UIFBfOnQ6QpLEljp6TQzwrjVMifGd/N93GR3/XX9iE0Qqmjc2SYEHxAhxK53u1I61hyA
         ScqdwjqxNrqke80toAlmzvrIrlJg5C2zl6j4TIxovLNSFnHFJ9BsTby0UeQigCLaRg+i
         YjPcK9/mBXkwnKB09R8DDXDJ7OkfOiefzP+KwCSLB21KLTb9P2aJ7mk5J3ztwjxVx+9j
         y/RAp4cD8RRy16qB1QIDGTBTXa2iuWvt20KcxFbym7Nvx5oA1My2GVTdbDHA7oN6LvVA
         TWDA==
X-Gm-Message-State: AOJu0YyjtuyBAMBP3YTeNhfXZtQUPGqSYfFkwytgalALDaJzUumBe57g
	ajf5dhmqnG/9HQZR889jSZioxDpBAKKD+83KlILy7rFNDNWj4+JrqNO38WqcTxbeQMF19ymxeeE
	qiA/TDR22QauLF+coz0IExKWjIGyiJhhT81SAvZ7y2qSRXTQozRIBpeMlhsusa/QgSSEv
X-Gm-Gg: ASbGncsV4BJegLLKAr6MmK0Ti+ajGDqa26jYxZKjQA7KtV3iyEdansE22vzhVyOBXdH
	AQMcSz+0h3CVUEdgpYkiwA2GLi0W8suverBiNr7SnIRLgLY9Xij0nN/YyIHghhHuZzM++sdLkUa
	rV/1x4JuQ/9936fG0jIAQAUMr0PLNyDM1iHxQZQo9moMJ8rD+yeZTFAwVScUYYWATtYrSpouR18
	hXm2LGm6Kuz/MyN2s+jZqisN5ogJpSNbJeKmixrLj8nlSf6KagRVtqlzzzrHfxiDqDya3x/BwKH
	hMcxHiodwDZMJNhjHjS6ix14fzPN7x58Cit5GU62Fg==
X-Received: by 2002:a17:902:ccce:b0:215:8847:435c with SMTP id d9443c01a7336-21fb641c3cfmr68159545ad.12.1739288673377;
        Tue, 11 Feb 2025 07:44:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0Rp33ZF73xQSbNXUiw0TVhhlTiStmftw3Y7UxoUwMIn50Icg+IhiWjlPkwoU1LVeJIBcd4g==
X-Received: by 2002:a17:902:ccce:b0:215:8847:435c with SMTP id d9443c01a7336-21fb641c3cfmr68159185ad.12.1739288672974;
        Tue, 11 Feb 2025 07:44:32 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36510e34sm98399365ad.28.2025.02.11.07.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:44:32 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250206013854.174765-1-quic_periyasa@quicinc.com>
References: <20250206013854.174765-1-quic_periyasa@quicinc.com>
Subject: Re: [PATCH v9 0/9] wifi: ath12k: Add peer extended Rx statistics
 debugfs support
Message-Id: <173928867196.1115150.379592814481494848.b4-ty@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 07:44:31 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: WsPpk7ndMwgew26p19xelVae4Lmlhku_
X-Proofpoint-ORIG-GUID: WsPpk7ndMwgew26p19xelVae4Lmlhku_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=929
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_074435_348635_35FC68B0 
X-CRM114-Status: GOOD (  15.78  )
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


On Thu, 06 Feb 2025 07:08:45 +0530, Karthikeyan Periyasamy wrote:
> Currently, peer extended Rx statistics are not supported. Peer extended Rx
> statistics are collected form the TLV data reported in the monitor status
> Rx path. Therefore, add support for TLV tag parser handling and debugfs
> to configure and dump the collected information. Additionally, this series
> does not impact the WCN7850.
> 
> v9:
>  - updated the s-o-b as a last tag
> v8:
>  - Resend due to missed patches
> v7:
>  - Rebased on ToT
> v6:
>  wifi: ath12k: Add HAL_PHYRX_GENERIC_U_SIG TLV parsing support
>  wifi: ath12k: Add HAL_PHYRX_GENERIC_EHT_SIG TLV parsing support
>  wifi: ath12k: Add HAL_RX_PPDU_START_USER_INFO TLV parsing support
>   - modified the return type as void
> v5:
>  Removed the patch "wifi: ath12k: Add EHT rate statistics support" since it
>  is already merged
> v4:
>  wifi: ath12k: Add peer extended Rx statistics debugfs support
>   - fixed the kernel test robot noticed build errors
> v3:
>  wifi: ath12k: Add peer extended Rx statistics debugfs support
>   - avoid ext_rx_stats filter overwrite in default filter setting
> v2:
>  wifi: ath12k: Add HAL_PHYRX_GENERIC_U_SIG TLV parsing support
>  wifi: ath12k: Add HAL_PHYRX_GENERIC_EHT_SIG TLV parsing support
>   - fixed the length calculation in the EHT radiotap procedure
> 
> [...]

Applied, thanks!

[1/9] wifi: ath12k: Add HAL_PHYRX_GENERIC_U_SIG TLV parsing support
      commit: a5f3c2b89136f13f18ea64fc1144691ca771b98b
[2/9] wifi: ath12k: Add HAL_PHYRX_GENERIC_EHT_SIG TLV parsing support
      commit: f756f878692f688640f6994a4dacd98665a2bc2f
[3/9] wifi: ath12k: Add HAL_RX_PPDU_START_USER_INFO TLV parsing support
      commit: e6fa62bada8796d13f04e2538297b81decc1e335
[4/9] wifi: ath12k: Add HAL_PHYRX_OTHER_RECEIVE_INFO TLV parsing support
      commit: d939919a36f4606fb8312c502a53c0ecfbd85b2d
[5/9] wifi: ath12k: Update the peer id in PPDU end user stats TLV
      commit: 0cded0e413468183a3b2dd445ab3bdc4d4375967
[6/9] wifi: ath12k: fix the ampdu id fetch in the HAL_RX_MPDU_START TLV
      commit: dff4f278ee1ef12d822b7ed2a1048d27037209bb
[7/9] wifi: ath12k: Add EHT MCS support in Extended Rx statistics
      commit: 03ac9e9144c59dcfaeb213f80e7e00974325045a
[8/9] wifi: ath12k: Refactor the format of peer rate table information
      commit: 98677080467c2a6529a3288f430acb8c44f583a0
[9/9] wifi: ath12k: Add peer extended Rx statistics debugfs support
      commit: a412547f2a8bfcf6337691b6d498536f29dbf4b5

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


