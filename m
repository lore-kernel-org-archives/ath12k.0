Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6D5C61DD6
	for <ath12k@archiver.kernel.org>; Tue,  1 Sep 2026 08:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y9XBPzABw0UQkcDXKURVyK4ifQ2SzxR3C1Q/2MVPQ5w=; b=u1NOJwpZlwksBSHh7X/N0qIgys
	JCyJdkk6rG21V5G81m7vsDH1izSzSCGdZGOyAE5q/bHFTJ52p3RRCATpieQYw6GJrwvug8s+QbVzC
	xwdskxsxXregeakOiYCt70E18G+cptWxqE2mjUlaLJa+yBY5HT/hW/jsPITtPWnhXPmTPzn4ebPCy
	2HeewNt/bI2+4Y+zM6m47zulGI5jfXOGTK16RYaNulNaof9jr3kPu/TXK5Xsy9GSgM+uyGDt8yxfx
	f+HJIbhArtPZOYJz11QSGlr8eM2m/9XsXXdRKGUPACkdfCq0/mMP+03AxSiok4Y8U/C6jXOS/DeY5
	qNOl2EMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KI7-0000000BLWz-3i3Y;
	Tue, 01 Sep 2026 08:56:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KI6-0000000BLWe-0rK7
	for ath12k@lists.infradead.org;
	Tue, 01 Sep 2026 08:56:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Rhr1811511
	for <ath12k@lists.infradead.org>; Tue, 1 Sep 2026 08:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Y9XBPzABw0UQkcDXKURVyK4ifQ2SzxR3C1Q
	/2MVPQ5w=; b=QyrmW8KZLLUAU1nWsb36jgRsPlGyJd71HtQTUeXTIElMYRYjr3q
	dfHudVScwqVl+oiCoRCtEuBIwGEG5lryiuR9aWgLa78iR0sQFq9kgw3JcMZZ6wSA
	RUS5uOD4cIFJdzaVw1WKPtQjJnEWfiyJwW+hLcK4YLsXySoQeZmaX4L+42P0ehmR
	4KGKvKQfyKOMKxIJuKvnifI6q+EMb1Dsm+2ItdfaLq+QQDlagWlLP4v2OLy51MEI
	4v4svHdYUb8Y8pvfHuK50qpxMo1gUBf72H3d94eL3ANJ0dLNQuIGJ2sXEw5jcWoG
	PpyE9JP8mbWu5xgDMUvR5V69bnbvsdSwHDQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdd4duy0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 01 Sep 2026 08:56:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6f75c1219so14353975ad.3
        for <ath12k@lists.infradead.org>; Tue, 01 Sep 2026 01:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788252983; x=1788857783; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9XBPzABw0UQkcDXKURVyK4ifQ2SzxR3C1Q/2MVPQ5w=;
        b=ctNhlGpYEgiYM6m3bMxHs5lcfY394cusSfF09ZixjnHwC/rmqdlYFFv26cgCVWyOmH
         pmvLqxGqRu8U7kRGqDxdKy/iiwQqz96yiTrrJtdjurz7InC2U6J+FqpnNYZ7vNGHKfGo
         LXLabsKYfcGUC4H8oFD6k0/v0QtaeFsC2AkhYWKaUEdibNYQB+sFWoiitHv/hk8UxkhJ
         r7Qpf5AjPcauntV7ILgLRtB1lvotM7ImRSANCXcxYlxxf3xsERkrru8hoQUXooBoWlBo
         Ea8qO5MFsyZuPDiQZVblo3ap7lnuoZp4WQFC0YUayziibwKDVooEOGF1kBxdUW1LFVNi
         gwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788252983; x=1788857783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9XBPzABw0UQkcDXKURVyK4ifQ2SzxR3C1Q/2MVPQ5w=;
        b=JLNxSwT0YERQ7tuCE8uKa2gl9MUjAlVTet44bSDcvGNwWyoDAxgEwJYkHp/GFiLnSt
         s+U07V8YlgtOrD15ozSLgiLBLtKiBWlLGeXXA3nnaQZihGR6g8NWklIhFu+h+JzN8aSi
         X5j6+t450qS1j/Rib6gvChxMX3qmQrqtxgbqaLlNtZfZujOE9wpy8CFM20dkyQojS4ul
         /G2IGicbu1aY/pwamUW2QzeELqkLJvaoTYnNE51EBoS1nO6kOGaGTwGBH8TqwKsYYYGD
         PnFVbvni6TX8j8wPM3Prs/Dtd2ZOhpu2coopwGGIS58VZJghWmR/WPtguJsxfGNquUOV
         RNgg==
X-Gm-Message-State: AFuF++kZFUZSyyWNgU81gmQde9El3R9JFBiQbHBCdKjuFz/Ai+bPYBuz
	25BoX8UBdD+Rr4ZPIxm1J6LK57Ct2MdZdA96l2QH7/+3CL8gtoyz1wfMhlbKQySaAvt1joTN/rt
	5s6u+OccsssPBhdk9A9IzLVFk4x2dumlTKrhNm6VBDCG9TlQ4qqjwUqdsaNEq8kvb0P7dx5Gr
X-Gm-Gg: AYBFou2tSsb6APVxgFDZXF1dFoJkk4tkn+a1Akic2podRrt+X4weXwexapi321bQDYm
	s68JOETK492mwzBJNJxhrmer0pjtnpoemRGt1KEBFs/jvN6K6sNAnC4q8wafy2SUWRZF77I3W5e
	kIXgKi/L3tBS6eEOQbeGpkxuyQ5HmZwiealc3Xd6EtWdB/tY9BiJ7brzji4N2WFDkLIH5m+Vfcq
	98kFnvJtruAQlXlM5+X7R/Hv3XND2EKHl14F0G1sK0UMJRejgF9aVqqZWm5IEP4BHBDvetSIGSk
	9/dCGMPcJgWIkX/Pai54TJbJp7Q9gF0mJ3kAmpKDu+wP+6SL4gI90KbU7PUKvjO/uUrHWt5Ww9A
	GPDkLhBnkuIL3Bvb581XBymBnrbKCLtj+xRHRsyFImpM7/c0au0gTaJmzzBKS+lh9br3Khdr6+P
	jv2Ljr9ILskzor/w==
X-Received: by 2002:a17:902:d588:b0:2d7:1e07:4859 with SMTP id d9443c01a7336-2d74dbe40e6mr528217985ad.2.1788252983194;
        Tue, 01 Sep 2026 01:56:23 -0700 (PDT)
X-Received: by 2002:a17:902:d588:b0:2d7:1e07:4859 with SMTP id d9443c01a7336-2d74dbe40e6mr528217215ad.2.1788252982493;
        Tue, 01 Sep 2026 01:56:22 -0700 (PDT)
Received: from hu-aisr-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b5bef7683sm22490776eec.12.2026.09.01.01.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:56:22 -0700 (PDT)
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Aishwarya R <aishwarya.r@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: remove duplicated STA state from link peers
Date: Tue,  1 Sep 2026 14:26:14 +0530
Message-Id: <20260901085616.2959268-1-aishwarya.r@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a969338 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=UqWUxUh_XSH1bq3hZJ4A:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3OSBTYWx0ZWRfX7ifQ7FEO+dK2
 zuekqiHC2QKnqsuThM+FajbEpD28tvQpduLFr0sykXv/6kUm37CnH21WvuMc5oYhK40igx0pixA
 Sc3bTXfQpPtmuH3V7cU8QYAVRtqUt6GH/fQEP6B/YZU1hg0SKmodGZoE24qPyyjMhoWRQBigGBk
 PejNqUirHjXZOWNF4WKuXOH45UoqpusYMdF26E/15qanaGycTQ83manZBz6Rue36+cR94yc5dL2
 UJvpBVELKlHfs+rM2X1sxf+ogDo5m7C+bxrdo6IvebLoqDe+nt2zAxKXuI/kWc2U2bnzUDo5u3c
 6KhV5XP18tvLMd7R5Ik3BGkhBVA8xi/0h7xMBY+WunnRYJ7I3t5yFXV0R8ypvoVpxfN3lXz6BtY
 g1ZT46/sLIk/gCLtaU2q8oECi3cUdZi58F7U+Ghn0bztqDZpnybf5AcUSu+4rLHnQ3MsyT2apzd
 b7WJYNZ/TBgmpkVV6ag==
X-Proofpoint-GUID: VfGiy71eNvl7qGIjtQdMwRROAB6dcLT4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3OSBTYWx0ZWRfX/nTaudK7QWSw
 CbhURflCPrnNuvosPBms0BUVGq9fNcLX9pJflYHvoEg01ggrG+G2/xJ7OJD1yGhfbCOd46lLeth
 KmMQAuwPlAbzvzy4sFSfaTv2JTlWLXI=
X-Proofpoint-ORIG-GUID: VfGiy71eNvl7qGIjtQdMwRROAB6dcLT4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_015626_359729_163DF0DB 
X-CRM114-Status: GOOD (  10.96  )
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

ath12k_dp_link_peer currently carries state that is not inherently
link-specific. Both the station pointer and authorization state are
shared across the links belonging to the same logical peer or station,
yet are stored separately in each link peer.

This series moves ownership of these fields to structures matching their
actual scope:

  * Store the station pointer only in ath12k_dp_peer.
  * Store authorization state only in ath12k_sta.

Doing so eliminates duplicated state, reduces bookkeeping required when
the state changes, and makes the ownership model clearer.

Patch 1 removes the duplicate sta pointer from ath12k_dp_link_peer and
updates users to retrieve it through ath12k_dp_peer.

Patch 2 moves is_authorized from ath12k_dp_link_peer to ath12k_sta and
updates authorization handling accordingly.

Aishwarya R (2):
  wifi: ath12k: store station pointer only in dp_peer
  wifi: ath12k: move is_authorized flag to ath12k_sta

 drivers/net/wireless/ath/ath12k/core.h        |  2 +
 drivers/net/wireless/ath/ath12k/dp_htt.c      |  2 +-
 drivers/net/wireless/ath/ath12k/dp_peer.c     | 29 ------------
 drivers/net/wireless/ath/ath12k/dp_peer.h     | 17 +++++--
 drivers/net/wireless/ath/ath12k/dp_rx.c       |  2 +-
 drivers/net/wireless/ath/ath12k/mac.c         | 47 ++++---------------
 drivers/net/wireless/ath/ath12k/peer.c        |  2 -
 .../net/wireless/ath/ath12k/wifi7/dp_mon.c    |  2 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 15 +++---
 drivers/net/wireless/ath/ath12k/wmi.c         |  2 +-
 10 files changed, 36 insertions(+), 84 deletions(-)

base-commit: e07447e654476262558bee570f4cf456e2b32565
-- 
2.34.1


