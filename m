Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47F0C83F21
	for <ath12k@archiver.kernel.org>; Mon, 14 Jul 2025 15:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rN3xI+b2jQb0LT3/s36eZ2egfjGu+f/4HTByzPiJLj0=; b=wsOA/QgLC5UiZpe6agvXggD9jz
	OfeYgSnz27oSCT9V8Glvd5Ec+UfX14sOfvLN7kgW4Zwh2JABzqQocdAnzqjzm9Ey9UTloExGAHmEa
	sBtyjCCEOwm2bsZGmV1f7SeE0+bZGnB7fvrvV4SbanvbJRajBcZZ1CTOCBOG82VLo6AcMd+tVhtcR
	JvMSloymXVS9PVxLyYUl4KRLROvL+w+AKuExqKEZLCloU6YkNyC/BLUnUSIY5+oKIbnn1Isu5BR76
	1koYmkgOKITNsl5wcJp7SSpe9Np+WE66UNfVSexrr0Pj7g2s2am967zz57fdMzU1wklyzheomVJy1
	jc8lU1og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKnV-00000002ZwA-04Sp;
	Mon, 14 Jul 2025 15:08:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKH5-00000002UmR-1gPD
	for ath12k@lists.infradead.org;
	Mon, 14 Jul 2025 14:35:24 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E8lptN016104
	for <ath12k@lists.infradead.org>; Mon, 14 Jul 2025 14:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rN3xI+b2jQb0LT3/s36eZ2egfjGu+f/4HTByzPiJLj0=; b=RH/jC2akp9/04loj
	rWB/OqxDPo4yJOUbazoble4MWsmKlNuWc0CzKYvhIaN5w+oX63RxIP8vprEvddTW
	hbptpdvVzkNRW5Fy+ovBdxUN6/I80ZlFcMvBF8rtvzYj0nQYz6Ywi2cyfK5MaQ6W
	Wgvg/ysSdLw2oaVlmguh508im0uKUPuQYPAyqQFKSmQ5ZN2U7Hs7mkMWsQ6cY7Nw
	4V/JSyH/TOPvMg3pPwO1iuIdDG7CceJFVWg8QelSZ/SsXyVe8w78gO/qJ9vhrtpu
	1L98ekWmEAeALRu4dSxLmAyrY6qioBkqHO/F9cAZedhk7Qcy1JiNp/KS6MrJRyt+
	ThyA6A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47v56a3gc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 14 Jul 2025 14:35:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2355651d204so43509645ad.2
        for <ath12k@lists.infradead.org>; Mon, 14 Jul 2025 07:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752503716; x=1753108516;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rN3xI+b2jQb0LT3/s36eZ2egfjGu+f/4HTByzPiJLj0=;
        b=NhaBXG6rnjyFZSACrFPkLgrOoq9ptAePBLIgJ2B+hrIJhpTgSrWA96Z79UoKjJuh5a
         rOobSElrz/QWFJNe4sao/bKEyn+YcRt3+Q6wl5/UcdDa491ip5btjXjKU0fYseyrKyHS
         3zmW6TtIMoUeb3GoSINKNAvBCWqfEc3j9Ijyv0FJmVFDhk0Ctf1Ljx4v6XcM4JRWTpOo
         dQBh+WAQoUdo9+23/8MePYv3SxQacDu2Qiyoxpz/8IX35bgijf5ZMAo/kKgZQXJxNR7n
         GNFqI8LBUeVyhXLoLH2MN0Tpp4cwoZub/atoUwD40F5yhviZphXZvj4yoBBBvykgeJxx
         zHhw==
X-Gm-Message-State: AOJu0YwqCcSixSAHImZgGo/WbsDpwxUa/z9dIRHXq8yOXe91nMNMWstE
	oupXd6B8ETmIsOpLXQiRICLLE2Qph+iozzWRPqE2aXps7V6Qnb68mF1GoEoO7BzSIsCTIOhqv9y
	HySU/FhPdKB3H7LEIDnnpaFItYBq4qlG47fSeURITTXGp44X5OyjzfhYBwXywixGMkEi0VGah
X-Gm-Gg: ASbGncsLb05cmd9bLwepqO6IcrXW1cdzLYUB1oBV1u4ieUIc2tmoM1E2d1/GWwQkrq2
	8wTwdYq6KiQgnh4HGQ934eBYXj1+s/Ob52Dt9Iwk+UsAptZdvMGWf+Dbg3GXAa2+BlKtv3Dy3MJ
	iziGR1T6kBPzajS0dxJtjGHFILrb1bbpAXuBMQ6zxid/s/ltMBpYnk2zkvVyCO5KiSARFep+EVh
	ircvagZBnokdAcFinYTNOPAkzmrN16L93gsTGyYV1w5iFUXv8HD7HnJDxfVNrsjcD+NFftbnA8a
	mgn6NGLMu3spCso3fKhdUl3EhK8hRIe4oVCw/Klez3WZ+P4xqemS9vXxoWu6Sp5H/nXyM8n9YO3
	X
X-Received: by 2002:a17:902:f603:b0:234:d292:be7f with SMTP id d9443c01a7336-23dede7d45dmr179425365ad.31.1752503715833;
        Mon, 14 Jul 2025 07:35:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGe0JsKnhzgQMV0HTKNkoIOJWCm4t2UqcNbD2jbln+6oqnUb0KMlhnhxmEtmpq7iTEOsr3aZw==
X-Received: by 2002:a17:902:f603:b0:234:d292:be7f with SMTP id d9443c01a7336-23dede7d45dmr179425015ad.31.1752503715222;
        Mon, 14 Jul 2025 07:35:15 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4331900sm92953295ad.150.2025.07.14.07.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 07:35:14 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: linux-wireless@vger.kernel.org, Sriram R <quic_srirrama@quicinc.com>
In-Reply-To: <20250711091704.3704379-1-quic_rdevanat@quicinc.com>
References: <20250711091704.3704379-1-quic_rdevanat@quicinc.com>
Subject: Re: [PATCH v3] wifi: ath12k: Add support to enqueue management
 frame at MLD level
Message-Id: <175250371444.2067518.17555745608400098717.b4-ty@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 07:35:14 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: CdUsKzsWECCmyiinfATy8incewQG7Lgj
X-Authority-Analysis: v=2.4 cv=X7BSKHTe c=1 sm=1 tr=0 ts=687515aa cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KBP__w1C_Dc6RnaA_GkA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: CdUsKzsWECCmyiinfATy8incewQG7Lgj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA4NiBTYWx0ZWRfX7H6Bxw71qAR5
 tNoRSkKNfIvGEJY76rGktT8PQ6TM1Vspg9A571lTbgaQnrM7LCwpSBLJPGRcU07F4XsQsiUg17l
 ywoQubLumiATvJy446h+3GfRK2nrJnikid6jBkoJ9AEkEzGRkCRn2lIFyneWtHdAxxPHIhAz5dP
 +32aRjsYZcmZD729rIRcfWeETMC0D9Bs3e1/Zj9XMhMlh8L/yXVnupbc3yN2UzSBJAH1KLc6QCM
 gA3gnbUzQkwMehTEbL/Go8O1DJZLo402PR9Ghc8vu0EvKAAqO1uQPE/j9YmnPv+7+O025KUPpPQ
 F+5G1NRFWkQtcbBq0W92a4BZQe1i1v3Rw3LQGban5d3LtQRibUwmAXcJLnHgbrB43Wg5lDPCDkC
 FaapDMf9lrn2L4W04IMkFUdEYDnodWaFNkRDIhI7WCtf5t+EvsckvKUdsJhDv7h/0vh/CYAS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxlogscore=918 suspectscore=0 phishscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_073523_463078_3C9BBB06 
X-CRM114-Status: GOOD (  11.04  )
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


On Fri, 11 Jul 2025 14:47:04 +0530, Roopni Devanathan wrote:
> A multi-link client can use any link for transmissions. It can decide to
> put one link in power save mode for longer periods while listening on the
> other links as per MLD listen interval. Unicast management frames sent to
> that link station might get dropped if that link station is in power save
> mode or inactive. In such cases, firmware can take decision on which link
> to use.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Add support to enqueue management frame at MLD level
      commit: 9d2abd4162fca8a1eb46f664268dffad35c8ad20

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


