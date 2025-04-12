Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E69AC369AF
	for <ath12k@archiver.kernel.org>; Sat, 12 Apr 2025 04:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHhxVnAGB9Zoh9+suD3lVtuipknXqR2QPNNThDAj9x0=; b=KNgWQzpOnypLRc5g4Abxn85oq+
	L6itxAqBcoevgKxaWgJpiNOvOoJxtDuCp3sQXHn8GcZ6gxJOdMDjTT3eIQRgQLyPi9zT6bZxx2WSX
	IpFeIlyiDXnVq8WnlUNJplFpAKSJYGbYdJylyjb4MvipsZUfRja10MErE4nPLkN/wOXkT1viq1zlF
	pNnmdAzYmPq4cJw/yg5PJa755hxf/Gsxv8GTKI7rRviDHhtD7KFPOqtAK13GhwFcubHkm11tvw9dC
	pq1ozJnUSuk8NINLswlGLkfKvwlxGDzBiAE8E+C1OA8EzsSw6xyj0IW3IkyUHSm9dFpabHqM/o1q6
	Kln+Ma3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3SPe-0000000FPMB-04sW
	for ath12k@archiver.kernel.org;
	Sat, 12 Apr 2025 04:24:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3SPb-0000000FPKP-2oK6
	for ath12k@lists.infradead.org;
	Sat, 12 Apr 2025 04:24:12 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53C3jbZN018309
	for <ath12k@lists.infradead.org>; Sat, 12 Apr 2025 04:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MHhxVnAGB9Zoh9+suD3lVtuipknXqR2QPNNThDAj9x0=; b=RV4dFO4K3N3xTXXi
	o4PUK1M+Hy47iUB7rHTx1Ye5e9UZRI57KH1Tpd2bQXFCbtelyeiZqM922ZzKPtzb
	daGhZfrg9scNWaBAAjK7bSlZ5KQB5agq45vT84VgE4JuCpT4Ve98LbzMtdp3w3Tx
	P72x82i95vT6yCXZFhnBI2RccX+mJdgu1CH3vp9G4FY/ttc6opG2Ee3pkX2GldWX
	soo9eUubImqiNy48D7S2py79VlmOAQQGl8KQ4zUCQabrIz7Y/nNaL+vNHexjRe3M
	8o078f9BP3M7/PdoULlnKhBk3TOkwkoUNB8yyDE7xZZ6v3TBpHPSln0o1VyEXW60
	NjXuMQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd681u3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 12 Apr 2025 04:24:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3032ea03448so2429848a91.2
        for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 21:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744431850; x=1745036650;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHhxVnAGB9Zoh9+suD3lVtuipknXqR2QPNNThDAj9x0=;
        b=bRAlueA7Zu1+blLerc4Iy8PJwm5ZVsmmkNzXv622VsfKS1rQBD84gvDnoNBhJ4DKuW
         MNZwDt3NUevVXmB0i8j7iTcTzVbW1LeS9OhreeQ2JIG0ZMAqHbq3SzmcaNmDDnRc8WWt
         Wm6ydYiW7f37m6YAiZLjA4sXZubJpj1nNLRHem184P6sov/TDLZzX50b2mPJiRxgqxTf
         NUXi/3/W5sA9sikhBHJgykKf7VMahYHBsRqEGPlmKBhqeBiHRbQwP1Itt4knPXodNYf7
         1hmhaTQRCMEcdAYOkTgAea+9g1y3Tqzq3tiEAazEpeY+wNss7cEKk142XR08LKc5BcTw
         j2dw==
X-Forwarded-Encrypted: i=1; AJvYcCWNu3zKbd4rni0+opbcZi/E+xcscGxxIIv3nnYpBCL+hSrYvN120MMpv3pPhZrCfIv5qLUJvM8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2cHUSO452kpciSUr/XxXAKdQkJLnKHFHAz5ix0pAVsn9mlQb4
	Ie4IJeep8FTe6x/jm5Gg2k3TLhjh2+Rx5dwHLKMcADVsF8kcWJ+FKRttDj1/kE+yD9S6TPW8VNn
	CxqJoSklQOJdREaXLFexxnKELcg3ih8WroB7nvFBehxuQom/Wry9qmg/kR1Q9
X-Gm-Gg: ASbGncuo3WPVko/bLIYX3bcxF1rf5gzYKNzaZC4SFTDS1pdaRkauH86K0llCWjcayfD
	xD9QxFJOnp6h6LkodADXntmPSUZW+RrBReoiHZ/Te15jK/pFttMpTtsOMxd42sKa+A04YoCs+1C
	nsP4dl8N6fu7witfhwNSFEzDFEwqhU7K7BAS5OT/HTH3dx/tP9D+Ii18IsQKba0yQU1ET3uUevh
	SV5q0gexV2Z5QZ3ZgMZxDoBxkSl8j06mCeoWPWaJD4gWbrIZvRPP3lM9x/0ZpHnxYNKm0Zwl/Nt
	vlc0E6IPohKxeaT9QcpD9QVL1PPzszBFpvlPdMCeJA/JuxtQ
X-Received: by 2002:a17:90b:5687:b0:2f1:3355:4a8f with SMTP id 98e67ed59e1d1-3082365a323mr8373957a91.4.1744431849854;
        Fri, 11 Apr 2025 21:24:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpLTEg2vWkUaoeaii00C38pjWMEPsiGj3v+UFlZWzDpgVqMQsxb8I9hd2bX5qPwxKfrzYZsw==
X-Received: by 2002:a17:90b:5687:b0:2f1:3355:4a8f with SMTP id 98e67ed59e1d1-3082365a323mr8373917a91.4.1744431849298;
        Fri, 11 Apr 2025 21:24:09 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e643sm6829912a91.12.2025.04.11.21.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 21:24:08 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Kang Yang <quic_kangyang@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250403-ath12k-cleanup-v1-1-ad8f67b0e9cf@quicinc.com>
References: <20250403-ath12k-cleanup-v1-1-ad8f67b0e9cf@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix cleanup path after mhi init
Message-Id: <174443184853.2972989.14317890740141451684.b4-ty@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 21:24:08 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: rNy29LVDBU4AFCOT8B4bV7GH4HF_0yej
X-Proofpoint-GUID: rNy29LVDBU4AFCOT8B4bV7GH4HF_0yej
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67f9eaea cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=9DHkI-QYbg47g42TtbkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504120029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_212411_721699_18738465 
X-CRM114-Status: UNSURE (   6.95  )
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


On Thu, 03 Apr 2025 15:34:29 +0530, Raj Kumar Bhagat wrote:
> Currently, the 'err_pci_msi_free' label is misplaced, causing the cleanup
> sequence to be incorrect. Fix this by moving the 'err_pci_msi_free' label
> to the correct position after 'err_irq_affinity_cleanup'.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00209-QCAHKSWPL_SILICONZ-1
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix cleanup path after mhi init
      commit: 6177c97fb6f05bf0473a2806e3bece7e77693209

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


