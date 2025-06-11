Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C54C71141
	for <ath12k@archiver.kernel.org>; Wed, 11 Jun 2025 21:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFtho7ENWI3L1kMm7ZZN60IgLuiwgvFjuHWZccWmsz0=; b=TGnTSpMf7J2OR+2U2YKNdg5uGh
	lzSkxDBExjScV4Jnr4Lc7BQEkTxG2X4lbbY1xoHiJOXYXprg5m3YRxGbJF55B4haFF809YpZApqpX
	S07ubspiH7oRxELXDHBFLZKxzwl+WR3XMWfQqEOHg6jjptlKNfz1ErCIzV5fMC24ruLvPMKbp8U/O
	XQw0Hz7dJ89o9tT2XZ+/rZNWlLyvp+WnYO8BNnXTyV138nVkG5P3yhUckwtpEnXt8VVID0TfL391y
	HC8aDyVKQ44h2YdKieFs8yP69uOUO00VxizovrehuJJXvxXjwyheZIhSh6I5Drq1wpjf6wb8rMrFN
	3Q7HjwUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSo9-0000000BGK4-3DN3;
	Wed, 11 Jun 2025 21:16:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5a-0000000AZCY-3OCN
	for ath12k@bombadil.infradead.org;
	Wed, 11 Jun 2025 16:14:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fFtho7ENWI3L1kMm7ZZN60IgLuiwgvFjuHWZccWmsz0=; b=FSM12sR+kA7/xW0DLndUpDGe3q
	2Mv0qnBGSgVEAopwQG6UaMfP39aXSkQWvQi6bORHigpqeaY20Jqc3vEb4WrPWkjf00y97t8s2UV8f
	x5KJ3M0rjvTy/nOGvMzJ6lMk2QKWkMYM6U+b1CNm1ORD7L5Dawr0+07doS6OpV0zo2sHKm4hQ5+Xg
	quqjK3H+neKk+Dows7aokuwU8Os9Ng/j7mLcASGg8JAX8xJTH2HbyzIwFW9j1HR0yqQCcGZCIQk94
	8ou0WHyrMcZcowtgxLOTG5fcdvcMWYw0E/hEgQ9UCs3LH4es3ZOI/hPwtGjnSFTl1E35uCsxzU3f/
	gVP/zPtA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5Y-00000002R3L-1KBL
	for ath12k@lists.infradead.org;
	Wed, 11 Jun 2025 16:14:10 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DDZb029236
	for <ath12k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fFtho7ENWI3L1kMm7ZZN60IgLuiwgvFjuHWZccWmsz0=; b=g7I16cCROfAeXNgH
	8KtUdf+KS7FzAM7sRJghl4Dm/PLyqnde6Vp9guqSFc7Iy+cK+ZwUkEF0szD0DIEa
	/aY6dTY8bn0ythUazLdawkZvL5KBgb/MLOd0IL8XgLCcGxQe/PzV1/wiiFhJKkM+
	jnsSmIlJF62FfnTtUih8lei6WWlHQlpESgpgez16GW3q+ct9efT8FH05hg7ouzJk
	u79d2+/TIUnZMlNWZE/pwK2fJEIRKy7PB/XvkG/g3XjoQYfmmfgIKrx66O+2cxkF
	3/Qu4i69vdRX4LvIgExuelKBK7bHL+WztPxoWDtCk6p5nYmhIaH3HuxX60r5VNPB
	BepFrQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn6djcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748269c6516so39671b3a.1
        for <ath12k@lists.infradead.org>; Wed, 11 Jun 2025 09:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749658442; x=1750263242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFtho7ENWI3L1kMm7ZZN60IgLuiwgvFjuHWZccWmsz0=;
        b=BgPbM4w9oGta69Cg4NwmyxmbCW2OPfMQNX7mBcN43RvpKtrr+jj5z2//MQQk7YrJ6K
         Zthf4GnwcxPfcUzi07OphQkvUaTGJ6PJB3bD8JNECBlGp22h8q7N8ofYG/9+HOmt25G4
         0aI6DGsJpaaUCIPKg0kaDLz85ayOcsEWqxOUvwv7n8Nl8WcWzUxkazJ4mPHm65YDf1kR
         cf3PBJH7Byyv4Hy9rpbOd3YcpUjUgBjbEFOk3HQW/dlAY6b2q+h2qA2F6d+TPr0b/Wln
         InjD/3qu//m3UI2Jbj7kBQy8sLo7NYwVoO3chrDosWiO46xmQeDQdHkJ6P5shstInzdv
         a53w==
X-Forwarded-Encrypted: i=1; AJvYcCUHoQ5zS9XFIKR1faOr57Ycxd5JBfbaKgoOisuR0nmUfqy/fIOoEZOU3WQ+44Eks/zJec7WpOA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzeRkRGBmELx+SzH7jKIz6Vk7WwdPsw2Hn6/qyQSX59Wl4BSdp4
	J74WorVoZrX3PfJ5u5KVctAYkxTyj75iMfs+3CuoNLknLTRu5D07FfH1/umZVZTlCoJJO2XVPIL
	L405oSX7d1qrWED0ENEy6LIeVwLfN4AFHjXvK6dP2hg2wq/UfAhK3G1UgLn1Tz0Sn+cFcdCHY
X-Gm-Gg: ASbGncvAzQt1XOrTDaiq2ZFnTQMmmBJm0kUjw43J6NaJKiJRzPDJN5Y4mpjUVhe3du6
	s3/hw5r8D6m9zVjZgjRdy22hB4/Px4RqbZ2oCHVHCPh1yax0QUn9FMwLK/t0bhO3DBLcX5DWtea
	mzkfUrIwaDsbLBfSe1K5x3h0Y6ySpZndYTzbh/Y1nITw+rKccqI+PvnnOnIewCb4Qy3/UuYb4Rq
	ND6PsKOrSH1OwUBhnZL/cX/v9SUeD0wlJi/QjiMGCrzbDFXJr7B3IFuqjuOhgfaS4jLrqO1Ln3h
	dmZagC7wevTpPubPq/3nk5qfluUgRCRZKJgXYskOb/CvwBVAJiTxS2rTxBc=
X-Received: by 2002:a05:6a00:124e:b0:742:aecc:c46b with SMTP id d2e1a72fcca58-7486cbd8633mr4706286b3a.15.1749658441817;
        Wed, 11 Jun 2025 09:14:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFO0qGQZKOb/hJZ+5EWYGdrvpghWgbeGHWYq9TkhEW2zl0TjeFA4FC23wTXpeMr4FHA8EIFAQ==
X-Received: by 2002:a05:6a00:124e:b0:742:aecc:c46b with SMTP id d2e1a72fcca58-7486cbd8633mr4706260b3a.15.1749658441432;
        Wed, 11 Jun 2025 09:14:01 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482cdf1c41sm9443708b3a.149.2025.06.11.09.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 09:14:01 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 09:13:54 -0700
Subject: [PATCH ath-next 1/5] wifi: ath: Add missing include of export.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-ath-unused-export-v1-1-c36819df7e7b@oss.qualcomm.com>
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
In-Reply-To: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEzNiBTYWx0ZWRfX41eYtSrOk0gN
 5bbTtlm2VUw/+86epYSBmjAJ/guECXcPSaon3k+31igL//3dIqi1q2Ki2dIVfz9oPNEbWxcf74L
 C3M46mT2Zn0n2XlQp4pbvCHpJzyDjrHdc//wEI8QhZTaB0uqwRNrAKgu2dMpvKLz6f0yWDc1qn+
 5bvzD1+/yPNHBtoTyIby1LWyAXRBJ34xzrgiUXqaF2ZGHPgkfxStdz5AhY5ICQWBFbjtTdnOMZG
 9Ihi2DsVyRlAO/HTP02WHirkBRZ/ZNm5qMXz6+QdTrj0hW9KJwdFLa95Axm7wzK2swbnDn9GwHG
 sc4Qggle+KpmI4Ql157UsXk4ednVC4LzuqF+CTfZGC8+2mRi5hrJbuZFgwShP/xFAAO+kR2UkKi
 YrTxfqiO9ZD2QIBXGZ96WX7DAxmtj/Ai74VN6U1iMUKL3gClZaVuGucCP75csO5dVRmHgpNF
X-Proofpoint-GUID: xur0nNpsnf4LFEZGoj59NKg3Zu18p4jM
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=6849ab4a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=rLkratNtAnnL-XKjWSkA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: xur0nNpsnf4LFEZGoj59NKg3Zu18p4jM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_171408_797057_F1493045 
X-CRM114-Status: GOOD (  11.37  )
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

Commit a934a57a42f6 ("scripts/misc-check: check missing #include
<linux/export.h> when W=1") introduced a new check that is producing
the following warning:

drivers/net/wireless/ath/main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Add the missing #include to satisfy the check.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/main.c b/drivers/net/wireless/ath/main.c
index 89f4b0513946916230dad4529df7c2d30402f2d8..d79d73738a816479107b130c6c0849de72442887 100644
--- a/drivers/net/wireless/ath/main.c
+++ b/drivers/net/wireless/ath/main.c
@@ -16,6 +16,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 

-- 
2.42.0


