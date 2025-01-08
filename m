Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33507E7719A
	for <ath12k@archiver.kernel.org>; Wed,  8 Jan 2025 00:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYwqajZr8THajm52U0U9+17Jpe4L46VqtT5A9QTXZ88=; b=FX45GMlP31AG5Eb43Htm0awayb
	0srNdA3csv3JjWEKYX3kzA2E/Kj/hf5+qOex9NwX9mjaKkFKyZB/3Pq7kCRJLKkxf8CsQzDUwC6TR
	tymAzj6tmMXdFV3MmTk+5UYVDQE6IXMI7WyG/2WbnDbutjmokzaZx2K4sLIqtWvJLvw0VBc5ZCWE3
	cza20qMQQeKAijgIYVmbAWlsS/V7QrlhVHCBE8/JlBGebuatjsHEyVVGdtB4Ot/0ssFpy73DSJr3S
	oru7Ph+K33QbzqU65I9d/Zy5AHILBP6HZBVwkQJQcYBLjB/0U5tGGXS+vQzVhxuTm15ohU+n05l9x
	cftMK3fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVJzr-00000006dOV-45LW
	for ath12k@archiver.kernel.org;
	Wed, 08 Jan 2025 00:32:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVJzp-00000006dN5-3NxV
	for ath12k@lists.infradead.org;
	Wed, 08 Jan 2025 00:32:30 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507J7k10014953
	for <ath12k@lists.infradead.org>; Wed, 8 Jan 2025 00:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYwqajZr8THajm52U0U9+17Jpe4L46VqtT5A9QTXZ88=; b=Oal097CTAJOCY2NA
	piZcXlVX4lS2AAhDWmOoJDrvYEeJVB+RzrqUHsKh3rV9li/BTnF44MjxrgVrJt/B
	VCWBnm/r4gQbyY/P+TlWu16W3oWPudEhM6uyO+wr4H5c8wxgm80QcwO/bb/UO4Rn
	bTuwtV63mJqHiJnAts5oU76D+9RGizTDqdLoqqffzkF2NWBU5YpWZIx2Q3amPWvr
	GgVliZiELhtc5aBIpcMVVATRPXwr+8cMX6MRDc8/fZl/JgvUJTP0m/n/4z0IUGqq
	2AuGp4jXYOrXtpeuoThi9bw+Q0P7vZhzXYk1VFSaKoZY2/QYyvcTt8l4g0+xdMnu
	7dao0g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441a5dgjbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 08 Jan 2025 00:32:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef9da03117so36304189a91.1
        for <ath12k@lists.infradead.org>; Tue, 07 Jan 2025 16:32:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736296347; x=1736901147;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZYwqajZr8THajm52U0U9+17Jpe4L46VqtT5A9QTXZ88=;
        b=QUa/Y37NwrMy7CVFfbIyJ68ZnB/xeVXec+S/ej8FNAoB1pkf1qDWnP5QkiLpa8hW55
         WF+D5m2Qc/IzChzSxIS7mxSG1PDoeH3p+Kq1zAJrMpS81+3o8sGNB2kK1E9904VhjcUn
         eNisiFmF6yvwHD0FNxk3dRMKH+dmPWdjtTlP32L/dlLV1LDXl+r7ELKhpHeFTNnZ+p/q
         euARqvCYZag6Sj92SZzlZNPBa9Fxj6s2qDn7JB25vIfGcjC7vJvsT2FLDMELFysvUOPW
         7NFks+QlpaeXDJE5uGz9/EhHNTjmuLwOSGN1zbNpGkB8fwWF7JqIWg5JR8WyK7YGHW4P
         zYoQ==
X-Gm-Message-State: AOJu0YxFGFe150XUHrtBGB0Seqw8VfQlzr72dKEZoui7dKZX3YSP8xTV
	5pyR/d0/RVTkHcZq1nINAV70bdfz/Y5qC8xoc9T++y13XZE/sFaY19/jvdLVWZekQS1i0Dpdfc2
	rF89O+feBW2drKworOtiFi0za19OADuyx+h7DPekeux5Y8QEjBrgpK11dMvpH
X-Gm-Gg: ASbGncs8LuWRqdLqKzW7GG0MvFipb88sRKzyW/va5URtiFEwKE2f+Z3xGELQKopvrZZ
	jJT5JT+x8ik5f24sgDtaqdGzFgj5g59IZttimY5FrRdoZBnOPuiF6PYW6Zym8P8PR2Uw14AP0/4
	E3YqbZFBDlKBiEqFJaN4A2wnyXJtUYPVMWuPyyQ3196cPTz/IHTBLLA65c/ZPVB4P783TN6UuDe
	vsxaPTNwwg7im8BOhn1rSr94oszwHzI7nUIIoqQ6ERawevOdAOZqooK4xfqQlEYkHzonNR+vT7P
	G87/2j3gDWoF/Ocvzg==
X-Received: by 2002:a05:6a00:179f:b0:72a:bc54:84f7 with SMTP id d2e1a72fcca58-72d21f4f2e5mr1434665b3a.12.1736296347597;
        Tue, 07 Jan 2025 16:32:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4LyTRPZ2Y7N91l4iAy90SJCNr5cuqrtOUJ3JGaN/4mogKJPcxGYJq1gxhkBi7cUgTpYGyfg==
X-Received: by 2002:a05:6a00:179f:b0:72a:bc54:84f7 with SMTP id d2e1a72fcca58-72d21f4f2e5mr1434632b3a.12.1736296347220;
        Tue, 07 Jan 2025 16:32:27 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dba83sm34041162b3a.116.2025.01.07.16.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 16:32:26 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Muna Sinada <quic_msinada@quicinc.com>
Cc: linux-wireless@vger.kernel.org,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
In-Reply-To: <20241219190845.605116-1-quic_msinada@quicinc.com>
References: <20241219190845.605116-1-quic_msinada@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: set flag for mgmt no-ack frames in Tx
 completion
Message-Id: <173629634607.3079396.7620610575380191117.b4-ty@oss.qualcomm.com>
Date: Tue, 07 Jan 2025 16:32:26 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: YukzshGd7IwdQpx8xIJEspZgplLXbmqN
X-Proofpoint-GUID: YukzshGd7IwdQpx8xIJEspZgplLXbmqN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 mlxlogscore=960 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_163229_971582_0A72BCD4 
X-CRM114-Status: UNSURE (   8.83  )
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


On Thu, 19 Dec 2024 11:08:45 -0800, Muna Sinada wrote:
> IEEE80211_TX_STAT_NOACK_TRANSMITTED flag signifies that frame was
> successfully transmitted without any errors when no-ack is requested.
> 
> In WMI Tx management completion path, driver is not setting
> IEEE80211_TX_STAT_NOACK_TRANSMITTED flag for the frames with
> IEEE80211_TX_CTL_NO_ACK. Without this flag, the management frame
> statistics will not track such frames.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: set flag for mgmt no-ack frames in Tx completion
      commit: 2d64da9ed5d8cee44a11ed3872dbfa6a914ee2b2

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


