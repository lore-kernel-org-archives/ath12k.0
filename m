Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF78C021A4
	for <ath12k@archiver.kernel.org>; Tue, 11 Feb 2025 15:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ITrKwMNT4N06eKH0yPG6F/r0R/zla5c3IopqvKxzWL0=; b=Lq4Q9rvXhBcY+vOMrr6UONMJv2
	g4cjvaajZBM+Nf83qioZ9b1u3oS8CauruYnoInqI9DmxMQdVDpLybMLRHVc0Vf8QxtE2hCn7ffEhQ
	foSEeWhBxVz8zqdr3hb8flQJx22hVy0lcyC1qj7UlHbtZh79Up5VuaSOgW668dazNkAg9jYiJRXK8
	qYHRTWiU0AYOrdM4OXic+RlUK9Ft2dPJsZw1H6UW35ibVEulr0o+Kq84kFBnocUTQvLXFMcvsFI9J
	BRgFBkKKF2Nu0Whlpr9w2SPA9tkBiB0Sqa/ZnwNxcEOVpN+3z0wBybElRfw/NxewofMe2l//sWpmB
	CiwdwcgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thsSS-00000004LPo-2teb
	for ath12k@archiver.kernel.org;
	Tue, 11 Feb 2025 15:45:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsRE-00000004LH6-0bIC
	for ath12k@lists.infradead.org;
	Tue, 11 Feb 2025 15:44:41 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BDvMKE010187
	for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 15:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ITrKwMNT4N06eKH0yPG6F/r0R/zla5c3IopqvKxzWL0=; b=Bjza727oKzfUGNg1
	vbgo/m1KZ6VOOfGgbKCy9nFuDzhKjszrwdnNrSR4YShDA+iLPe+LWKokZQQYkErh
	cDP/RY+3aMl273NZJH2w/dTvXOVQtvkQxzjpf1ZzHmVdLuxIBDzMT8bZ8C5mTS5b
	cfW81IhVYaAMES+6Z7joGbVoRWQv7N+WrMPOBC9wQWAUAjnf7TJztJy8nfmPPtl1
	/+cZeAqDhsLOzpgKdJtwiU0t8ZSsxeG/dvpnUDWs5md6vspN3PQV/wIVoHVHJYHw
	xe9qjN1EFUqyegy1T79/WKzY1MxXhjHLjSIm5F+IeacdUMDBbeuTpvFuBWqMM2IF
	TExnAA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs5cx0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 15:44:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fa440e16ddso7019595a91.0
        for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 07:44:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739288678; x=1739893478;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITrKwMNT4N06eKH0yPG6F/r0R/zla5c3IopqvKxzWL0=;
        b=lQl78ZPYuQ1A422eA77zzmuCx9eu8jrKF5K6OP14MFrqc0dJkVITpvpECRfmw0Knj0
         P7Ygce7tizWhpGGbfRa3rixaVSijvWUPls49MiiwEYPbgSxURSxUz3Jz3BjtYNDYfLXH
         U2+z2QQdJZbhQ2a2D+0A2JEZUfc6jMZEw/+EktCuJb6XpYbv4kVMnzwnquprZcjI1eSV
         AVCyp5f5EsWYVRQeAnu0GwO7bpTp/GzzVYk2p32wnF1PUDvju0mSx73vs9yTTzmDk2WX
         Hr+s+WW4CNHW+Ufif3gRfSTvh8fvnF2e4yWJ4VSIh+oKvBum1e+l6yLi0MxxFfQismKX
         xHWw==
X-Gm-Message-State: AOJu0YwZOdhU5P1Hy4EQYr+HxnFouQWs83F3eWCh93qIU9crFme38eHL
	OrviLCYE+pQho0ysWUy+7ITPPPlY0rXYcgFFpjZ3D8MqzEotfUcMWgUV1fQTaOm7yX5Kshxu9Gp
	XAPpz67PTw5eEN6v/u9lRHLU659J8IOhgm2y1aYRqXgxP6PjfVDvqgEttkIvAzdVg9g+M
X-Gm-Gg: ASbGnctqmcljQ21CN4b86UhcmDZs9USuMEGaspfJk1xBR9dBM5nHY9dO0fD/pdGCIVp
	qbwyl6o9jr8gzqnRs/2NTdWI2p5QEwdsvgeyFgvy8wBE+YL6wB4OsDJrbYdSC9qMO8od9QmPXpp
	nwL9i8kO/cUUkiOkBUPaqn9PPx1hAq9XGi7LU3Mhnr4/rnO15nAKsfbMJjMJnLvcC5lqmCL/cWA
	mWxByyYmN6Ggm/Nnbl2fwhF06eHmC2/M/trWq5FvbB7ds4JO+I6pTqj3N3HJRiqWtzelWV0FWvB
	5j3llCRq7qUHNDbcjNLQe7yKGdalSCHYlLp+hJ2xiQ==
X-Received: by 2002:a17:90b:3c90:b0:2fa:15ab:4dff with SMTP id 98e67ed59e1d1-2fa243ed7e4mr24018577a91.31.1739288677772;
        Tue, 11 Feb 2025 07:44:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwqRPrVGYpETO8nhswSaTSKsf4vcBIsDHnEOSxVVV0E0ousBwAvMIFvAhjcWHW+/3WS+pURQ==
X-Received: by 2002:a17:90b:3c90:b0:2fa:15ab:4dff with SMTP id 98e67ed59e1d1-2fa243ed7e4mr24018546a91.31.1739288677314;
        Tue, 11 Feb 2025 07:44:37 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36510e34sm98399365ad.28.2025.02.11.07.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:44:36 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Balamurugan Mahalingam <quic_bmahalin@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250203212647.2694566-1-quic_bmahalin@quicinc.com>
References: <20250203212647.2694566-1-quic_bmahalin@quicinc.com>
Subject: Re: [PATCH v4 0/2] wifi: ath12k: Add support for MLO Multicast
 Handling
Message-Id: <173928867612.1115150.17986588793384621390.b4-ty@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 07:44:36 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: cgSKyNwhdMFEaxqSGQ0e5BUMUPFZSqNQ
X-Proofpoint-GUID: cgSKyNwhdMFEaxqSGQ0e5BUMUPFZSqNQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=854 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502110104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_074440_302921_2BD9F402 
X-CRM114-Status: GOOD (  11.41  )
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


On Mon, 03 Feb 2025 13:26:45 -0800, Balamurugan Mahalingam wrote:
> Patch 1 updates the HTT TCL metadata version to use the new bit definitions
> 	of the field to pass additional information from Host to Firmware.
> 
> Patch 2 moves the MLO Multicast frame duplication logic to the driver to
> 	have more flexibility to update the HTT TCL metadata with the global
> 	sequence and with a special vdev id to indicate Multicast handling
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: Update HTT_TCL_METADATA version and bit mask definitions
      commit: 5d964966bd3ff48af92d941e1dcb581e6e572642
[2/2] wifi: ath12k: Add support for MLO Multicast handling in driver
      commit: 2f50de7256777003d40931f1732e6c644ec8cb80

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


