Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2971C02192
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 22:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0A6wgIKxOZI1z3zdXOomFIBddaIAgTmHOiA1HPyAkCI=; b=LF4MgiNxQc7lPIIj9tLY02aGOC
	7+teUV4mmdvWN9iQATJ+YThOPcKS3GmK4HL41qMD3JZ4BZeUOqovTtfuC+WkjDAcqrh72Jf4Yuyrv
	vwaXu0V39eGjgOwoMU5/jJXyms2Y4OGy+vxXki67yxTnSGqNoH1nMd5oYAM/0KPIigL3QfcaDipye
	WmmPFI+mtHlEOnyd0JhWwAS0jSvfJ49soyvjlY/kYqTx+yR76cHHmOSNl7hZYkKApB4fNfZNh8/lU
	/cLXV+XH9lf9eoQ8yoR55lgER/Qk2tohhx4wRt7yFLnLp0l3C2kQ5a68yDlAcx7i7PBHnPLduoC2W
	AhLW9crw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf5Fk-0000000GpGN-1yEg
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 22:49:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf5Fg-0000000GpDg-3QTK
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 22:49:13 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513IbV9l013122
	for <ath12k@lists.infradead.org>; Mon, 3 Feb 2025 22:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0A6wgIKxOZI1z3zdXOomFIBddaIAgTmHOiA1HPyAkCI=; b=LFH6wbR3+rOSa9wm
	+FipN1RduRYXLHp5PChCpSAqQl4leKKugFca0P8c1uCXJgYc1tcUKbdQel1lUW2r
	yuIuwNYr8GRyBnVsILaU38MvJNPY5TthMQpyJHdODmLL5l/r23g9ltZJLHrXw7vT
	QH0OvYd3wNMozBYuORMG5M3WR671IyadFZB/rKkfqwsgvoNEXbR1tOE5DcVeksHs
	HDNx52KO28eBmb7rowG0ta3rm45Nlm3mozqnqovsKiWs4ZE0RjixehMXf0j4nQqi
	uggLglTg/NeHHgRlOGo7MYEcaYnk5LXRLg3qq1S/XmT9EeHKxbxGeKlpuqlICrCn
	AIsMAA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k3890fjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 22:49:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2161d5b3eb5so101086785ad.3
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 14:49:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738622952; x=1739227752;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0A6wgIKxOZI1z3zdXOomFIBddaIAgTmHOiA1HPyAkCI=;
        b=ooRpME39fQ4y7sLV15iTbJYAU9Lc5hQZnuAM/yJYQcLer2o/F8TOV2Vc/wANU9TZx7
         G2Pb9sLWy11cRjWNigl+Qp5GNqAkU63XfBo4qpfk9RdvNtrev2q6bZKP8eBNm1oiMnYX
         B5WzdeqaB+nmq81zbFzpCE1MntS8/lVtmyBz+yJ7t9LMrBh6dDuk6kf7VipMc6cmSjat
         r5BP7tnn8ryTV9EnX+EH12IlSnxzQJDaZOxR9vyGv0oPBALAF812iNx7JfTilJs55PZq
         qv84C9wb9WeKtEbL5FTM5ztYyhK8rtvgtIcBaQ0GhxLu1kpjpFm7mgW5Cge2K7/pHnzl
         uobQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqW99f+zueWfcMjj5l5r5NXq77IlZ4FBCh2PcRiO5G61CsSlj/FArFOqPzRtdTTPaxekMi+yU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzddoRd+EJ7vHg6DC87eNhTpAr36ADBUEJLxyvD9g7hIXoYHgjY
	D1cd5U+H8ZWse0pj/kfu45RvCRa3GTFRMbNAyQF/588rs90w7xIT6+CGogYz/2EE62AJVfbmCg+
	al+dabsJ77rLkkjXoGF6VVavC3tjFHaY4Bcp+dFtxm9aP8DnpcQD9+oLlI8V0
X-Gm-Gg: ASbGncsUhmfUBrpPTG//HcHSUC3vX13foeKtCpGCJz1ZjlqjIiOxOiTKE3iGpV+vaBg
	8bGviJEUWskTMt4wb4HMudez2LhlmypP/+1m4p0G6W/qxubBnUhlnhoidaDZDnqfPheVI0T5JIU
	jUCWgvBSHsGaGQTdxLlFOo84Q35ufZ2W1Y4dQiWhgvG7pKiGv77W3fdq9DPzi65xFHhi8waUule
	Gf9NtMh47Bvs2hXxN82D3FGdFIYV7S0JQA0K6GhQZOoeBtKo6fUXTaknyiFRigwEfR/ejTPsNvY
	G2sVsxFIrzXM2mGSTZlREvrd4CcsTvfxpJ5uhGC1Jg==
X-Received: by 2002:a05:6a21:3406:b0:1e1:a576:aec with SMTP id adf61e73a8af0-1ed7a462f1dmr40404063637.8.1738622951693;
        Mon, 03 Feb 2025 14:49:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGY+o8EhRGLgXC/8FHqBM3Hq6MLun4L+ClAm8k8UyqHdT3OFzYo9so1tpjQQIlwluCscLDM7Q==
X-Received: by 2002:a05:6a21:3406:b0:1e1:a576:aec with SMTP id adf61e73a8af0-1ed7a462f1dmr40404026637.8.1738622951192;
        Mon, 03 Feb 2025 14:49:11 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba353sm8887444b3a.112.2025.02.03.14.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 14:49:10 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250110-fix_link_sta_bandwidth_update-v1-0-61b6f3ef2ea3@quicinc.com>
References: <20250110-fix_link_sta_bandwidth_update-v1-0-61b6f3ef2ea3@quicinc.com>
Subject: Re: [PATCH 0/2] wifi: ath12k: handle
 ath12k_mac_ieee80211_sta_bw_to_wmi() for link sta
Message-Id: <173862295041.3734728.16749672295096616341.b4-ty@oss.qualcomm.com>
Date: Mon, 03 Feb 2025 14:49:10 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: 2N95j0mHX41L83ZPNkfb0KB9Mv8boPey
X-Proofpoint-GUID: 2N95j0mHX41L83ZPNkfb0KB9Mv8boPey
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_09,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 mlxlogscore=559 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502030166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_144912_866200_937D2357 
X-CRM114-Status: UNSURE (   9.60  )
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


On Fri, 10 Jan 2025 00:13:11 +0530, Aditya Kumar Singh wrote:
> Currently ath12k_mac_ieee80211_sta_bw_to_wmi() handles the bandwidth from
> sta's deflink member. This works only for non-ML station. Now that MLO
> support is there, extend this function to use link sta instead of deflink.
> 
> Patch 1 relocates ath12k_mac_ieee80211_sta_bw_to_wmi() so that it can be
> called from a function used in Patch 2. No functionality change.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: relocate ath12k_mac_ieee80211_sta_bw_to_wmi()
      commit: 090c645b2acc835cccf52a8876dccec55629f479
[2/2] wifi: ath12k: handle ath12k_mac_ieee80211_sta_bw_to_wmi() for link sta
      commit: 2fc98b24adb93457254ee16418cffa89de038ad9

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


