Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5DEC4450A
	for <ath12k@archiver.kernel.org>; Tue, 14 Jul 2026 18:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4cwIiZjrWhhujr7Ycu1J4jI0XrF4W5pmiE7ofFwj3M=; b=J70Eq/lRgzdJIPjXKnrgvCISoE
	jWWcRZ0/JNhz5cHL4hFam8w8ixJCO5Ypt+Rx0UOMdOM7v65MxzgaX/WPj7QmbVMIULYbz5JyyYJ7q
	62G1zfFBZF3mfoEabQz0yiJDJL1ihN1VxLU+Vg+uJEN/Dq/l5oqmfWKTRPuFQAJYdS0zF7gmHuVjB
	zjnKir3GSAKQGnJnm8i64VFHi/3KNVbroKvJrE7Zf2/J70eY3fRkdFb58RGbmNP7qLJPp9/6k472G
	MIPjr8TLEDrUw22uWAE2ZZP6YP3X64EJOVcg4af48TjMZM78efZUUOBKG6szJ/wTsgfhTu26PBGRv
	bNRA1YCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhXp-0000000Cq3u-1tlC;
	Tue, 14 Jul 2026 18:07:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhXm-0000000Cq3b-0Vu7
	for ath12k@lists.infradead.org;
	Tue, 14 Jul 2026 18:07:47 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG7AFg1091430
	for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 18:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A4cwIiZjrWhhujr7Ycu1J4jI0XrF4W5pmiE7ofFwj3M=; b=fhlhpIaIPSgcfDVr
	OsCWFuugZwZ0A0s79OQbT3j9xVY3+szQnupMHU2QwLbRMBDU56S2ymXJMZ4ceil4
	mFsg3jrrAfSKwvOBJNA3V4d8v5k6HR5enHdPXVLA6hoLH2ba38H7v2KKLoj/Wpsi
	z9di22fX9QX+dhfwKvRNsjP3hT3rClj4fyA1Xr/WMNwm1QxZLmCX5mE7y6D3fbjB
	jv1AM8m+c1fMFvYq8ttwehKs5TfOeRZMku/x1/sXOm9UeFDWtMqn5y3Nh5yT348y
	d5awK4bYjJj/MEPYVvz9QNDv2CaSg3Yl+XyWqEJwuyoyGkore6UlDG+hNv2cHet7
	PeRxTg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgudjgcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 18:07:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4f27f49bso643892985a.0
        for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 11:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784052464; x=1784657264; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A4cwIiZjrWhhujr7Ycu1J4jI0XrF4W5pmiE7ofFwj3M=;
        b=MjF+G3/8Wp4+kgG7wgoqa+4vSxxtr00D4PNfUz7sHZ2cUNbl4wGtDVD8Ec/FTaP3VG
         /vz1kEmOb7Co/2WZv9zVbbBsW9HoMY6WpkcMenNrnD5y1ebuH1YO3e2fIAuR3Iqf8RWE
         jHFJYQqm1zjBnD7dOQaVmd7sw6Tmi+h8FHd49EMD3stJQYkzQzJpJFmbjkOMSqvLOSfP
         bKXgsPf1ix3ROWjYpsJb3gUsdD2yVPA+Edb8qvAoh8KdYQoH0leqRXUOwcD1DzG6daUN
         X59UNUHXgd+9aFv6UcX6eQ81cIO23McmSUBZ0EACD/IIKwZ8t83X6IfA08qG66WIDDfZ
         7YcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784052464; x=1784657264;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A4cwIiZjrWhhujr7Ycu1J4jI0XrF4W5pmiE7ofFwj3M=;
        b=X+OPtREltUPxnEgmUlKe9V/FxSsw7mfwoweb6/ylHRPercRLoGyZF35gi+s/JDNo4Z
         ErIhFTq8pvsv3j7r4uDMNlrta6En3+ABO11ZCNEP3XtVjbjZ00gD19nid+DARaG5g1na
         KS5NQNP4oSCV7PUBzqwo5SrPo8vPl0r93cg+SP4NpGwFMzgUV/j0QDS4ws32WAA4YjAK
         FpHlapcotuagYNEN84SVsrwQm4iQoa+t4ffCdI9wITQWEqneadHgPcU7QJYFRXjC+KG3
         /GlYwbeye+Bi6W0fR6PNljdvlwQ4799e+4JwsU3YSjHh2Q6u7cpf0W75Fm4iI7U3nX4/
         Trvg==
X-Forwarded-Encrypted: i=1; AHgh+RoEK0yw4YIX4U8pfMViB4bfe8THZJp1xmPyvoo4hJ36Ga57ZwVvDyYPSQnrPqUS1VI5pNrgr94=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvk+1MN/4AF9eJhZhz9daPWr/Qe2uZqhfQJOr7Js8fcc4BxDHr
	kVXbxsOM7EqERxdQ9xDovBfLXZYdxH0K9cLkhe/a2T0YgkOhs5OLyft0HhFqrP80yAxpDb/HhHa
	DfjJekGF2l4TBfTotjaecP3H/tFD+GQ8k7MYEMqKxoqx1S0+q5X+QmFK3rLb/4XU527hrgFf9
X-Gm-Gg: AfdE7cmljd4JHXBmO9lsPsl9ZzBYOI4xoCovGNNb29EQJ82FT+M4sr11Iah8a3eTYxx
	+//fKC6ViRxOQF+M2FP7ie7YaU6MjDEuRJGHsPO34U/7XPM5baJsNWQla0Hh2B0TXWPxMKyXWO6
	82cReqAeECH9+tgeJTcUtLkp7/medDzSlqbVjos5PSthkaQphcwxbZYQzY07rJK6DMPHx26UAS0
	me2fOouQ3f5H5obov6a4ZXd55tAcpNVWX9BUdEGdOwCwJ9kI1kzMPf4p5nx5N3hSVeNaQhPF6ll
	g6uC/qigZWQcttkv5YDmyXA0zY+df324QkKmFF/dJWF8SBQcsilg8pQL11JOuvDm9Ow2U0nxTEr
	fk9UAQVYJMQeLKintOwGshFZ2aTjy7DGkCzPBIvJT3vnk13KtuS77kyHwsCcjAnmnKA==
X-Received: by 2002:a05:620a:4623:b0:92f:40d:654a with SMTP id af79cd13be357-93083d8bcb0mr448751185a.68.1784052464261;
        Tue, 14 Jul 2026 11:07:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:92f:40d:654a with SMTP id af79cd13be357-93083d8bcb0mr448746585a.68.1784052463750;
        Tue, 14 Jul 2026 11:07:43 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930759c63fbsm465448885a.22.2026.07.14.11.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:07:43 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
In-Reply-To: <20260629-ath12k-mlo-peer-delete-race-v2-0-362b25590d19@oss.qualcomm.com>
References: <20260629-ath12k-mlo-peer-delete-race-v2-0-362b25590d19@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: fix peer delete race in
 MLO scenario
Message-Id: <178405246269.4102418.5502186641350358668.b4-ty@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:07:42 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: zzb5nAiLI3XKInjBKiA6-p-8lA69gxZe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE4NyBTYWx0ZWRfX+FMAMXLizsCy
 PUi2U64xAnKB+jdE5AEqXE4LfRj8nFBFCdl4RNHBVHOacWS48MCGp3Q3qEnCPyDCXjnHzzXslmv
 fkyi+SDK92ki3J8eD0zrdnn2S8x22jQeu51PyEa0ddcOrS9hQJ1FpswF30cv7SKm/pP9YLPwMbi
 8ugaVG2xBgXo5taEIgkWW8JUssbhYXMLe1hVHPGbhMflcT5PuIc4R+SfwD722YnBb2mXkWsCfpB
 RX5x8s0T/dgzcMy+Geq+Ydu/D9SOR5bU7xk1M5Ulegse+gVDYzz/GvhDh4DppzRhfejJuHWWcgS
 zMQLFKvBa/v69qS69G4xuxwn6YOW3m7MDFPtY4/+cgfVaM7j6pn77yCqBNwGM0qwC19EXe6M5dY
 7BT5k5MPplIrpqtQjx8Dmant0qVLD/jIbpbyJ0QV1uTD7+PuAqquKU6d805yeYfQJ713ArK5e5I
 qcrLAJdpwM8BvwjkbXw==
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a567af1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=F5jKS3pZUGwt7ymI3AEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE4NyBTYWx0ZWRfX9seynSjCLUx3
 bzdsRtV1PCI3VBlY5z4MVlckwBEqSz0REJkdUq17Zw2Pjp72N+ffdh5URKshiUfbJOlv6oSqdUT
 zSf5N4g0MIL/QFkqt1eDflpYfY3IJi0=
X-Proofpoint-ORIG-GUID: zzb5nAiLI3XKInjBKiA6-p-8lA69gxZe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_110746_285894_C0CB8ED2 
X-CRM114-Status: UNSURE (   7.94  )
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


On Mon, 29 Jun 2026 15:01:16 +0800, Baochen Qiang wrote:
> Patch 1 fixes a pre-existing UAF in ath12k_mac_vdev_create()'s
> err_peer_del rollback path.
> 
> Patch 2 fixes "Timeout in receiving peer delete response" on MLO
> disconnect, caused by a per-radio shared completion that gets
> clobbered between back-to-back WMI peer_delete sends.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: fix dp_link_peer dangling references on AP vdev rollback
      commit: f066e1a93703c5be0fd905109d00587541711c97
[2/2] wifi: ath12k: fix MLO peer delete race
      commit: 01cc0f59aac3574b6a7b02493a76bc8ed0aa758f

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


