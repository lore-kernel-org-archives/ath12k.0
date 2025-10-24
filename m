Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89053CCF9EB
	for <ath12k@archiver.kernel.org>; Fri, 24 Oct 2025 14:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tUMUyakynfKB8Xyi0j8WHxEx4h2ADucIePXA/2iTng=; b=UH4wGRaeKEZ0EQuTXFIm9iIJ5K
	akQqGmT77h+tdE52Ghv4MAWGkO2n9T5caT+UHHFWWhGMj0RYL79g8uq8IrfafPdZNRExn033AjxhU
	2gko7kMBQlA30MMhrSwzyuT3Rj/1ciB3/a0O7nWHHao0O6wBBtQi6NkL91q9fIawx3gYQvegFRKjr
	9Zfm8WjHCZnAQcKwhVCNrgoUILSyAhgpnMXxrfKSVnnop+LaTp51P3WpKzzTxomeTUbCQWI0TkRM/
	zjWePrBAAZwyO6LhZmbvC8TpdLP9KZVeehxDpbfj31vm1o1WcrhBLmu+XXcByC0E6HzaxXZ6U5v5M
	PSI/QUOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJ4R-00000009hRv-1KkG;
	Fri, 24 Oct 2025 14:47:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJ4N-00000009hQX-10zE
	for ath12k@lists.infradead.org;
	Fri, 24 Oct 2025 14:47:09 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OCDJ9q017659
	for <ath12k@lists.infradead.org>; Fri, 24 Oct 2025 14:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8tUMUyakynfKB8Xyi0j8WHxEx4h2ADucIePXA/2iTng=; b=ZHjt9leRNa5ItDNX
	eVNlJk9JhO+p97kQO6aJv+n0sa0uIzVYdOiiPMvLq0F26oE/uUoYs6+JpI3rXuBg
	zrvrzVxs9ZbOwTRskVyxer0FJyCyTuTxbjD8xX8J/KlIap+J1LwFDzJp1SW4Zsjl
	S36JMH8EVsooC7p84BXA71/c4mKRoGT0QN+L1bfCCZQCcwXwJKwhFpnXDnjljVnA
	CPN25zypFNtxyjS0Xt6KUcsNGzLWTWCFzKTwP5iqJqPzcEC6y9ZpHGK/Qgg0oVlQ
	Ru3Fi8UhTrlqVt3tIXBpsEsDO7g8clRLYbhWQgqSpIMHPbaiYp9GHAstXOFETu28
	Q6hu2w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49yp6k3kbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Oct 2025 14:47:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6d0121b1c5so1182412a12.0
        for <ath12k@lists.infradead.org>; Fri, 24 Oct 2025 07:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761317226; x=1761922026;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8tUMUyakynfKB8Xyi0j8WHxEx4h2ADucIePXA/2iTng=;
        b=H4hNiduwEW2mAIqaUl3CSO5yfLj7a5vIxY68h3KRUVkECLey0N5VabQQ5IRGLtAhj6
         6Zlu86s64Jiwr+a7CbaszVwFsd0f6Z++Zsm0RMfFgGcNCUHlGfFfp4EKrCHyXJYLGBzB
         kTbgzn8M6uPGkHlJblvdAeWW93D+W5VaNLkHLgxEa1sQOGHgTRA/6MRf45gZ3hI6dRqF
         sUfnKDQDIgPpEksHWtaA1K+H5geBr7rNWkttgt5E5UGma/paiwbS0pn8QoM/lqH+dns7
         xBp+yLtAnecUJAUhgTUSsJMVRsuZ1f8uKGSN6bbU7DSnEYVFmXxw3onRxVR0P3niuA8E
         BcCA==
X-Gm-Message-State: AOJu0Yw89Zl8/pMVSRfLprMiiWQFwxaZGaJkMzaePOgc+hAtqxcTTICf
	cFBbmUEWLOvShzmcEYsGaOB3D6OPw9fg7Njqn5ohU63Uj4UQtjOTPQLl1qrD9WmE/8aL6xDMDI0
	WeXfnYrvTt5fLHC896wMAOaXue7ynVfio6EJ/9lRa9gQWVu1cEcLBSoI2vEP4/iQ8VIoC4htG
X-Gm-Gg: ASbGnct7pmsw1Zd73dkyFhMIXBKMnQWvEL0+jNWwOp83P4fe6CFDoO2niOSOqx4Rtk0
	w3KPeUgkBCI/w3Oa4DNY+9tVW4QHFfGK4o0uFMeQHjors1EgVusv5oQ+BHlLBh/cMmKK0dJZ2v9
	2B1JFbqlNNAKZlf2rhR2K/Wj9gicDGbZ1a0DiG1BiKODWvZCJR3rbwccMVhrrSjTezdSY/oa1AW
	PSaJRgHV/xL9ecnynYI+CtJpNSSwrcm3Nlcb84lTtutLcZ00Dkn94hAwl8ziRWMxOUXlma0JiLV
	9M7CcjPbBo62JSHzSh8KyQ6c+zM0Nw5oBPiGKIxMerZcN+wEgKnY2LflMKe+M8zedTdu08W7XEp
	TocP1WrScFeR859xhGbdbEWWCeLAvtLmoaq8=
X-Received: by 2002:a17:903:2309:b0:262:79a:93fb with SMTP id d9443c01a7336-290ca121803mr384424955ad.32.1761317225802;
        Fri, 24 Oct 2025 07:47:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV/SyNy88bCx9RA0BmgRcHQMdPgTjByIaAKXxLkGcLIUgfzWvT5s4/cufHiu/Pk8jWjrZKtw==
X-Received: by 2002:a17:903:2309:b0:262:79a:93fb with SMTP id d9443c01a7336-290ca121803mr384424575ad.32.1761317225360;
        Fri, 24 Oct 2025 07:47:05 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dda5771sm58169035ad.18.2025.10.24.07.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 07:47:04 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Wei Zhang <wei.zhang@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
In-Reply-To: <20251017060100.1751692-1-wei.zhang@oss.qualcomm.com>
References: <20251017060100.1751692-1-wei.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v2 ath-next] wifi: ath12k: add support for BSS color
 change
Message-Id: <176131722470.1606896.2554698564582461997.b4-ty@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 07:47:04 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDEzMSBTYWx0ZWRfXwG2hLkBvhzww
 I9EwwBjcOuZsAuZC/UuIhdoahiM9la/8dIX8SsKApVhjuG3Dm3C3clHG6L9JDzxADl9Z2xHI/ot
 TazVXXvSBSvyxjqy/jGStAw3ee4WORJb0gwN8fN4UBcm5kRLF71ySgigz87EwNZGtVoLe3OmD6L
 8RDmlnka+pFZj06vARTANrEaA2e7pRFe8VCZoE/fKxM3MIAiDvL4N20nX+M5ICZwPXr6dqBhUvf
 rmCioza3IdS8UyVQPAa1eRGiM8jMPjhUWsiodGcVm6w79v8VtnYyJXmKGPniyM1TZIugIzLwIBQ
 DJD7gc7kEIwWXDbJkFwFSpewvt0lFgsFiPyTH0BoxXuPVn6PfpLb+L25WmfcuVCf4xb4uoRG5eG
 /7ndTfNQ+wKYjaNXJEfGZURJppz4Eg==
X-Proofpoint-GUID: LqpHfjYCZd7Txb49PpCMM3nDsPBsRwZN
X-Authority-Analysis: v=2.4 cv=bL8b4f+Z c=1 sm=1 tr=0 ts=68fb916a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=wmkh4GOX6cRBnxIyw40A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: LqpHfjYCZd7Txb49PpCMM3nDsPBsRwZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510230131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_074707_293671_99A5E438 
X-CRM114-Status: GOOD (  12.04  )
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


On Thu, 16 Oct 2025 23:01:00 -0700, Wei Zhang wrote:
> Add support for handling BSS color collision events reported by firmware.
> 
> There are two scenarios where a BSS color collision may be detected:
> 1. The AP's MAC detects the collision directly, and firmware reports a
>    BSS color collision event to the host.
> 2. A STA associated with the AP detects the collision. The notification
>    frame from the peer is routed directly to the AP firmware, which handles
>    it and sends the BSS color collision event to the host.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: add support for BSS color change
      commit: f7746cfcdbc5d3af9c5059deed30e277d926098b

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


