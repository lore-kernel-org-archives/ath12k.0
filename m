Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF81C43327
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 21:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhhkZmKx754FpQG3LSpxtJ8DbK3S6BsACSSh6KRavYE=; b=PPogphy8BRlf2Qxnur7K13bl+N
	/pE5hd+g4+8KP0QsEglJddhmhHK/pDaAaqwJvFkqIVN9eDNI/F+kV/m1BHRVfmVnMjXMrzXklgNaG
	c72j4eZcjacbcgkrLBE46KSseiUUZd5nKPbiihdB9XX4h4Kcb47lE0GF4Z3ck5B0RAXHA5KrdXg2H
	GjFVls9ykonZzFRQadLePtkA+7mk+YRDZqjReUdH+JPRJ/ljl7Wk3RxTZF0s9pgCoQCJCxNcSajC+
	q+NTWwbaHleC5EgqsFdZHURBLSVLSCQ7efAlLHjmx6xYnlKYiu4Qs2urszw+ImBamEB/TUpoc3Bnl
	AXgfmCPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefz9-00000000FAd-1S2V;
	Tue, 30 Jun 2026 21:27:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefyi-00000000Evq-1eRn
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 21:26:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDaPL2959908
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fhhkZmKx754FpQG3LSpxtJ8DbK3S6BsACSSh6KRavYE=; b=H4fBN0MLk7PBSUmO
	NQwxZcBKDGBMPyf/gV3cscCX8kVjTuV12FtlC8wPrXl3Rqxeq4FusWz1fwOtO/8/
	WnKVE836oKP4Tqu2sNkEaCJ8/QwB/dnNuBixrn0Y2GPnqmRvS4kecu99HGfqlr4j
	SfChbIgkSCOn/CKJBMRyYdri3o3bY5mN45Z4ZSZzRpTPPc/2KcJwzUOaQAO67eZ0
	lahKsHkG0lbl0DCkB2mMnE6241d5/3+VkWHm4wuDMDVyrvYQ4MM8gkQEAd4oKGfz
	YQ9u5Qq8x/UgfADezhbpBjp3dZuJwTfBDZwEnv0qdUHY5C9OvnK/YEfVcb4NbvOk
	+mgUSw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j911028-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:47 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c011c7cb9so14065425eec.1
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 14:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782854807; x=1783459607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhhkZmKx754FpQG3LSpxtJ8DbK3S6BsACSSh6KRavYE=;
        b=P8tHlVuOsh82zcyUkwZRKH4FmzYrY0xTt0Ty7zbQSQbW6K4GOSCOVnynbBxvz6aspl
         APzzT7MQILDcr9n98NOE2QMsCb/m32+6SL/vyEEJCH7LsfvfrJnXCEI84xpm9Oaq2Qye
         N8fpDFP2kB+oGmbcREkVKurpo0LVHTw3n0h2Urovr4Cr4Q9qSsJ0lyrjH5bdxWwLWCTc
         ZTKUQ2DB0RRJknMQP8vYwunwhg53P0mg5Y1iVXzQX22lPJnztAhoibBdib8741MaApuA
         cd8SbhkktA8GWaB1UpdTzGNjD2CJW3Ia3oPRvGrX88lE2Vr5WLNVyxr6TQpcCgTrMkUE
         a93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854807; x=1783459607;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fhhkZmKx754FpQG3LSpxtJ8DbK3S6BsACSSh6KRavYE=;
        b=b2l1l5ZzQXfYtDAvy075nq0ckfOgrmHT1zLGtc8JSJa5WQ2P7XI40Heja7QvXvyukH
         qqzRrSqdPwKn6cIkGFhwTNrLqzvl9RAHhBUQeC7pY9kBwMFi5xxjO83DOGhkmr6c6whR
         NvdyPtFNLaNMrC4JqQxATB2WMiJIvGQiznfXohlwtmB8dRPqc7ryouArbnNxhO49szrE
         Cu3LqjH0/3VvEVWzFnlpFn3rEQcaZIYmxF6xyPWQeOctsnXKwVty6ie4SKWRcxyp6vTS
         qS0d43xdjzAZSlZ2+Kvl2gRr/BT5uPiVCpkbbaiFSZt+uU59jRjXNSOfSC+Ab+FXuPrt
         vlNg==
X-Gm-Message-State: AOJu0Yw8aRTGcKN4H40goGQQOYDG1SaPeTVW6wh6YtVzpebxq4EXii5z
	h3xg54OFiRl/GXKW5VlPgCNLP/CEMNZQxX1Nb9GeZL3+bcsAQymYuidN27MTFrs0qy4Mnh6ILXt
	zWWh/TM5GgKCmswF5TZKIR0Ru8F9q8sEhM/E2jxIHZmKbTDsxY74A7McMijKbCYe7BkxCjiAA
X-Gm-Gg: AfdE7cmeF8r0CD88X12ZYsgU10F2K2bixprLUDKBl4H3iRzEFtPMP9wMUCaUhnUZN4n
	l44CpRPisQve+Fgb4WN/ebWCVpeN7iXiPiWh4fsOXXRr2CWP0faA3CFP7Eg9hnf+u75loBxGyyk
	RdxVHg/KMzNTiMgB6kPf/QBXx6NuaP4gkWSs1l24QSuuo0+NOYiUAilb4lNC92SN4/EC+QK8Bvv
	LbQX1siLekabbd4MnELUwxeOZRz+++JSlL3hNSpn+DQnTQClA2BGBT7vRWVla2QcmIm6S4l83iD
	aYXDLN/AgQmTknYDoAwAEV9BAz5cc67iHHSxOSi/BMVcnbhR7U6aovmRA9vmyJWBlZSWNSA6gse
	lqWOFhKXgu56l4mHF9C/ZCw6fa4URR/C49HsRQl1kwxJo0e8tLVezkcwIySrB4ckBrQ==
X-Received: by 2002:a05:7300:508:b0:30c:5ebf:63c9 with SMTP id 5a478bee46e88-30ee12c2c20mr4448525eec.5.1782854807187;
        Tue, 30 Jun 2026 14:26:47 -0700 (PDT)
X-Received: by 2002:a05:7300:508:b0:30c:5ebf:63c9 with SMTP id 5a478bee46e88-30ee12c2c20mr4448491eec.5.1782854806639;
        Tue, 30 Jun 2026 14:26:46 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee300b286sm11604046eec.12.2026.06.30.14.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:26:43 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260616062342.4079796-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260616062342.4079796-1-aaradhana.sahu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2] wifi: ath12k: correct monitor destination
 ring size
Message-Id: <178285480373.1590147.11222841690664583671.b4-ty@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:26:43 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: byoQ1l77aObvbHg0v3sAuNuhd9Msqomf
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a443497 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: byoQ1l77aObvbHg0v3sAuNuhd9Msqomf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfXxS2RgsbCbmyu
 JyrG73ruAKjjvCJooEdMhNhnT5WyhNQqVWOERzdV97agrx/2/2yo3tlBP999lxeuzKy4kACoISl
 amR1Ca1Oky0Y+TdT7mfUadVBzn5yKjE0fF0tBTbUQNLq++S4mk/1GNk7GfObZPaSWe7oO6E3rF1
 pjsn0dEjke0iof/yjxQv4OqbXFL+3YggUtyQGAtAtvU79gUyRwtbavvqGGTaC61r1nbWjGg7JQo
 vdqcPoQjqEJt/gS0rw8V87xGhrH9pQzuoWl0YNMcE/OUDQPQywIlstOW8ulH+QHWEY77vNpgCAj
 s7xj63kpJyV+rTU/WUzch/sKto+dL+eQVv5eQ+EsuTrAITaR6MseeQtlUoT6BnpvdwihtM00pZz
 LDOsRO76zhBrJOaxHX7vZaFKjteHmXVxAanYeYjY+pQschC4ybLGMJD5Ph/VgY4mVyu5bKTlKyG
 /TyBDsCT7KtfWx/RQ5A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfX4YXI8BRNXHhs
 4ux3aXtZdOz5hixPbCDNUn6hfppL1fgfhXVRsjHue69biW2T+fRa4P8oeBQC4ZmDqO6YSInvdKf
 eZgpInRt3OzUd59c9bSNG5WKx6QIWmg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_142648_529770_7595F7AC 
X-CRM114-Status: UNSURE (   7.93  )
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


On Tue, 16 Jun 2026 11:53:42 +0530, Aaradhana Sahu wrote:
> The default memory profile configures rxdma_monitor_dst_ring_size as 8092,
> which is a typo. The intended value is 8192, consistent with all other ring
> sizes in the table being powers of two.
> 
> Correct the monitor destination ring size to 8192.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: correct monitor destination ring size
      commit: 913998f903fb1432c0046c33003db38a9e8bedb1

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


