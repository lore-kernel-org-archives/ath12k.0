Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A5E606A31E
	for <ath12k@archiver.kernel.org>; Tue, 24 Nov 2026 04:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3UxOb5wC;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fVP/CgHb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ED1p7f8k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=srp+BNh2F/qpTXCm39aHwglnhCN6uyvhwOXUePFtp84=; b=3UxOb5wCpYb/4ZPC+6UwzpW9pk
	af7w+vE1w3i0OZJuBq6nDeOyXFNvRegpjx/OkktvMcxrnTTxomteEjzfmfzI5Bn5MknWVIl1Y5Gm5
	e9+nXd2SOVJA5G5lrghM+IrcrkAll4+K2+/JzxnluELf7UvsI9oDrUgvmQjf35cqnPNuYLqaOMmkt
	qEqgJOxf7LpGBUGUBmSWOPvmiSDkCFYUlN8h4oMIJZBV05oaFaLv6hANV6lKpGhwdjwrPpgKPkMCa
	AuGVyShhFckCVwUhdGqFmTWZaN1NYXVJxkjInigsAY0TL1JxMPkKeRJ/icdCzawt+yqwiZjBKRx4p
	KMfrtv+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xViX3-00000005ZjY-1kA5;
	Tue, 24 Nov 2026 04:53:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xViWv-00000005Zis-05hX
	for ath12k@lists.infradead.org;
	Tue, 24 Nov 2026 04:53:27 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2k3jQ3701186
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 04:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=srp+BNh2F/qpTXCm39aHwg
	lnhCN6uyvhwOXUePFtp84=; b=fVP/CgHbNLM7gnmyhMHvzTmn10kBGm6C7YpzJ1
	v5BDzbMY5huRlTFzHT/sJjCbpEbKDwyM3hT+DWFcf9hZZ8cpBn3AIpeUKtZBvyts
	JrjON0n9rYSC7G1WAkUtXWcOe7DKz2QIwDcMpN+ywN2fBcG1kJGzN9QsH8Cl+xFq
	mCTTOYw6acNlRt87cYbob8FeOce9CL23pKeV6A4Ce2gOe6Ii+c9ahqQkyk4gWVb+
	93dWxmM4fqO17jQ2njm/iFT7nHwz5nwrwdVjTpLYrGCS5vPEmfpaBEkmpDQ4Q/kk
	CF0T8JoazVIAFKPLRFG8//b7tr0Jw2jfF3oxT6GX6FQBncXQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky0pbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 04:53:20 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386a65fca25so2781820eec.0
        for <ath12k@lists.infradead.org>; Mon, 23 Nov 2026 20:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795495999; x=1796100799; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=srp+BNh2F/qpTXCm39aHwglnhCN6uyvhwOXUePFtp84=;
        b=ED1p7f8kEb2hr6iiWwavC7LpoylejMPiNDDXoY6+Z74ckwptUOi2wSIi7f/w9jeOgD
         0SbW6D15iGvMe5Tn44n41JHvq93MEYgqHXHtYbLSnkamGfhSqZqcemhVlmnfzgL+jqJ3
         zHYZqB1fhSOSf4gs1+ZMAq+jlPOMtT1SxJRIEoCaXDoBBt4IhKJXORdM23Wpf4PuEZgr
         zIQ2GFNTIACOWCARssIgbRc2HdgeVD//ws9zdkqvKlCRBaFuIcZ+KU0of6y+fd29lw6L
         Kr+iq2FZXjjR69xNb73uki6FYtbWY++w3lBsK4sDy72QG9VtZ3oY82eaTQwWd92soAG0
         R5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795495999; x=1796100799;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=srp+BNh2F/qpTXCm39aHwglnhCN6uyvhwOXUePFtp84=;
        b=J3KZnd9/0+mjwDXZ9hHH2Whg/91fLyXOckN6pB68Loj5aXAkM+HLsZnvnXr1B5QzCg
         rGhMx8u9X83Ebt7waKqeu60IRAsyhg2wEz2RvWUHyTYgGxrMmN/Gk7RK7D8nnnFDKG+1
         0DKS2SF2MYiXB6xZH6ToAD5PHj2921pc12+h8/RweAUx6czdxMRtF7CFq3yWaUoeH6k0
         sFNlQrW+o7qNF8gMixjfVu93ZRJ6BQQOZqdDmq4Fy03Io1OJUcVfpgXkaEACLWOqtwIv
         iEUsfkR1ztUpywYMZ9Ia2lubqXmqQgh9dTx3DsVE7QYzIbXN0mVkOM7asQwQTHAslgPS
         XHfw==
X-Gm-Message-State: APuU4Z9L1Fzef0vyZYTvhAvjTGRbs9VG/YnrLvlIkmzwdK7vft4m79ch
	3612qIPCKVx8kpWwb7bmYv0htKu+V3L5DmiLvEBlTPFnmqVpq4OFqxRWwuq96XHIBCpuus6Lczw
	vo2tlCqhU6AXY6meymUBEY/6HcqPmmFuV87jF+WyRJlugnTc6W7PZweYWHjupvYAftqpmTvL5
X-Gm-Gg: AZFdTZd3z4D7+lR/RPkdYlypwZzk9RjMQ0T0IFj+cLGLU/KtY4ap/uIYFEIeyWcmBl8
	5kZ/RjHQTKwVBEIfu364T46MFRPte0iIAtJ0Z0FXxlR148GmQKr7dORMQqk00HnemC7JOKWVE/m
	tyKMTr64IpE4MtNbNc8iDJ9/ZzrcMEv1i84jzjHhsh9+FKT/cq1Q+qWXjXvhQNdVVEDrOizoN2+
	YbcW7fRLKWCjzpvJxmeaWlcrskuSzCVOulxosD1l5OENlh4peLwlhnYw0KH+AXeGuubAx16D49H
	M5lVj6as34B5EKe+AvXDCZ967O5cm6BoXd5yfYBVpwYN+mV/qykmZbdYTkF9e8XyVEMEL1VozcS
	0hatD6sGgG1AJEgQ4UkNd9JJzQK02IOJiy/QjjqHztV8HHg1rs9OiSGmsCSeAVyb6ZDNxYMODK/
	LmNH6Vbh1nxbrPMXXhvchQyypPTm5dAdWmBAlIQk7NeHfoOTBTz7uDOtR0iPiGgKjYjSQ=
X-Received: by 2002:a05:7301:714:b0:379:730d:db52 with SMTP id 5a478bee46e88-3857045098amr12851010eec.32.1795495999504;
        Mon, 23 Nov 2026 20:53:19 -0800 (PST)
X-Received: by 2002:a05:7301:714:b0:379:730d:db52 with SMTP id 5a478bee46e88-3857045098amr12850985eec.32.1795495998922;
        Mon, 23 Nov 2026 20:53:18 -0800 (PST)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm71045609eec.3.2026.11.23.20.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 20:53:18 -0800 (PST)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 10:23:16 +0530
Subject: [PATCH] .mailmap: add entries for Raj Kumar Bhagat
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-raj-mailmap-v1-1-eb94fd73c492@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADsYBWsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMT3aLELN3cxMyc3MQCXQPL1NSkFAsT88REUyWgjoKi1LTMCrBp0bG
 1tQDteIwjXQAAAA==
X-Change-ID: 20261124-raj-mailmap-09eebd847aa5
To: ath12k@lists.infradead.org
Cc: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b051840 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=coPjFYPWAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8
 a=1XWaLZrsAAAA:8 a=p-nOP-kxAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8
 a=tzP3hANRY55mueRoif0A:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=PHqHxvoSLtS9In37M5wo:22 a=XN2wCei03jY4uMu7D0Wg:22 a=TjNXssC_j7lpFel5tvFf:22
 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-GUID: O49CEc3uhebxvO7jkH2nBRo2Z7lp6pQ_
X-Proofpoint-ORIG-GUID: O49CEc3uhebxvO7jkH2nBRo2Z7lp6pQ_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAxOSBTYWx0ZWRfX866Xax7HZer3
 5dbR4nrLfLrwXFFXgCV6viJZE+rS8Oypdm7ackrYQZUJpne4tLssdAHqOpXtU1UjMvvROQaVBl7
 m9n1j1DhtX/kNW6sSTCwtBnTi14a7EY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAxOSBTYWx0ZWRfXxiN0PG33wA1U
 FkMKXBqQsw1DgxlOGTGnGvaKIXI+9JIcSV5lANlVjDc6SiYYWNeaa1r6h8Y8EuvmeZmHv8oKVJG
 7GnBi0oi0J9wOdNxeCd+RgMXV/Fbq0kUk9FBfG9b1InKpQGdgR8FBbNo/4ojv2EwcdxIGF0bXmx
 YDKlFDt6fTWXEJJeLiFO8Fr9NCf/LkWoRN6/Hv90DLYgENDo7GAaScU4EpBlwAIFm53niodrRID
 k8oirFQct0vVZWxf4/rTJjvyQ49ELVpOhi1GBSPT0CDutg8tBbVwTUJ5mLVJmHA9+SGUaplQwJ8
 JCpKSdQGG61VbQURd97NBVX3LHgQN83c9KQaPTi47JnzWmSYCnMbv7kOiT+DQUe/X5YziHPkZw+
 NX0jBokUlJ0qMdfyw3/lWk86KWwJy0aOXTYtSkL+qzUX876qr2CwIckLP7sVMHau1Sj6z8GMwg9
 cBe2GKMwREwWgRoJ4Iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_205324_619518_AFF222A7 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Map past iterations of my e-mail addresses to the current one.

Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 2fb413038180..97ff416b5828 100644
--- a/.mailmap
+++ b/.mailmap
@@ -806,6 +806,7 @@ Radu Rendec <radu@rendec.net> <radu.rendec@gmail.com>
 Radu Rendec <radu@rendec.net> <rrendec@redhat.com>
 Rae Moar <raemoar63@gmail.com> <rmoar@google.com>
 Rafael J. Wysocki <rjw@rjwysocki.net> <rjw@sisk.pl>
+Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com> <quic_rajkbhag@quicinc.com>
 Rajeev Nandan <quic_rajeevny@quicinc.com> <rajeevny@codeaurora.org>
 Rajendra Nayak <quic_rjendra@quicinc.com> <rnayak@codeaurora.org>
 Rajeshwari Ravindra Kamble <quic_rkambl@quicinc.com> <rkambl@codeaurora.org>

---
base-commit: 03b7c601b6e314115015a57061f5b377afe13190
change-id: 20261124-raj-mailmap-09eebd847aa5


