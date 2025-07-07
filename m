Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC531C83030
	for <ath12k@archiver.kernel.org>; Mon,  7 Jul 2025 22:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58sLsyVBxSODICZUsU9uTkMyvgRokbpHZA7Sf2AjOd0=; b=bV0nR6ofjiuzKXhJ8PUzuo/jAG
	xRflps+g6jVNGkR/lHNnXb4RUnRRfkQQvv6KmEuUle/46XFDn8vtvXhxPa0Q87OVXoXuZYBRif6A5
	hV++GlIweNTwMUxmVCHvxhhEbWa3GRiScbslvUpNWairj2Eifrewvrm0UyMdjih5sgGQLPvf+8qdC
	4WfF/KtzPduKJsooYvTmka/mdjbwCNsitKdoOfQPFx4z9+7Hxv1pTq/aCrLgS9o5XGzcrogXtm1xY
	rxPQWHceOIzS4UPvROepkuyl9Jx61VCI0T8B8XvgCxNqJDZ3sVTIY9XJPf+DUtsZbekukhs1mj8iq
	4xRbOBRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYuRn-00000003ifi-2Zts;
	Mon, 07 Jul 2025 22:36:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYuRk-00000003ie4-3XMO
	for ath12k@lists.infradead.org;
	Mon, 07 Jul 2025 22:36:26 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567J9VG0009670
	for <ath12k@lists.infradead.org>; Mon, 7 Jul 2025 22:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	58sLsyVBxSODICZUsU9uTkMyvgRokbpHZA7Sf2AjOd0=; b=BhmZIHvw63tpvk/8
	QpeKBX5hTMzaabOhnxdkJjDkNVtM50WxVy3aGR5SKBcG83JFBPg3XSwCDME169Z3
	i7nsETj4OGz+5Wqi2aVerkRTkgo12QXYXGln08SQMzc/2g5x4Ij+ulkF5MasdbJL
	a+GdJVrHBWU8uSHx7y3jZvjLqZw6SrRgk0IWwnQYh3yeHZW8mNlVjWteD5H4Cd9e
	+Lhz6KV4F7TUgVHcWHtjWiiOy1BDNIWvXJ2WrzdYJ/L0YfKNElt4WOCEBho5t9VY
	Td/UkHQlEmz6TY3tjsr8SDoyuCJfxnA98OadwMBx0w61sJfJ6QN0szGnu04r8enn
	Xz+64w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtkgpc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 07 Jul 2025 22:36:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74943a7cd9aso5623195b3a.3
        for <ath12k@lists.infradead.org>; Mon, 07 Jul 2025 15:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751927783; x=1752532583;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58sLsyVBxSODICZUsU9uTkMyvgRokbpHZA7Sf2AjOd0=;
        b=Quv3eFCBEZ47qPr5yqO9i8uotIz21+pes1RMLa19ADjLjbPSsGzDHO84BB5hoiQD+8
         ycIEsxtPqLpmek1rl4AJPnlnQ/I9ke6XbEynHSjsgaS5ywVlhtASg9z+MULJwJMzGHgs
         3ygiDAYtlBqmb0TQY/48h1fMU0HgsfWz4FpTMyKWVrmQMSYERLBVhPEiCnFjrHJ/oJxA
         GfdIDgCSamlzhhCrhPzWuWqQ/zzeBJpRpOTlkvfx5s6MzzbaO6wOBhRhC1sszwPP0UQ6
         ua8SW19zCxT5T1REDA4fFKlwcl+A5aEC+ikxj5ITCci49zPNiQCwazAHNmOT3RwbiAlI
         +WtA==
X-Forwarded-Encrypted: i=1; AJvYcCUlHtCOUOAqzA20FrpctwT/W12SM9K6sPagU5X/2XX+7S/xdNI6xJWiBIMabX61yNGx4h2bJaA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzCNS9bveJr8ojM1M7wIILIbGsRXGW8/60cQvk+xILlXszmHlbu
	ycW2FPGKdyAzhu8+q9dhZAXkuebgpzFDCUBQzKjXWCjb8ZNtC3IQ5/8XTKQxbx2/rDDEsjA6tEc
	he7EZxNwvF1oP3hnVQYfeJXqHedDf/AVa0znYcALkwSd+Pa+lKOrDqhzd8QoRObl3cxIbmBiw
X-Gm-Gg: ASbGncsNNR1+1kvPGbWdqXj5R+XbfOiZ15OeUTLNCkLqCb15830DS8GZRvx2EFb0bm2
	XpyiPldlIQFUGb8WlnyPOLaEgdkpp7H2y3vrlgyIwPyhFmdkj+qgo8/gSwGHq3J9UzzETjjAjXh
	HPTLXgQ/TFXqrzoiVBGsma7112mLN8XoqQspQ2TdqjVROPP+SUYYX4jBDiFMQkDR5E8UG32VjIF
	MvTcXFLrwSXDFVMs7IRVl+CrvjDrmWIlbwtN/48dX1H48vsMkYHvBqMSVcDbcD2VKNwsnNomWpv
	cBJsaecmNBb3GPkm7CeCtD4gEUbCzQULL5+MHJuitqTGcvndHU5rDaH9pK0=
X-Received: by 2002:a05:6a00:2354:b0:73f:f816:dd78 with SMTP id d2e1a72fcca58-74ce8ab166amr21446831b3a.15.1751927782732;
        Mon, 07 Jul 2025 15:36:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwBqL+fxR/ucQx5k8AE51TsXkHh05PJEkfhYYKNNad+uzcD6SMzfUayMwxjD5BCxoUPKNXaA==
X-Received: by 2002:a05:6a00:2354:b0:73f:f816:dd78 with SMTP id d2e1a72fcca58-74ce8ab166amr21446812b3a.15.1751927782351;
        Mon, 07 Jul 2025 15:36:22 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee6358edsm9668064a12.58.2025.07.07.15.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 15:36:21 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250630-support-for-tx-power-insertion-v1-0-77f45484d5bb@oss.qualcomm.com>
References: <20250630-support-for-tx-power-insertion-v1-0-77f45484d5bb@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: add support for Tx Power
 insertion
Message-Id: <175192778158.314276.5668474308481760371.b4-ty@oss.qualcomm.com>
Date: Mon, 07 Jul 2025 15:36:21 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDE1NiBTYWx0ZWRfXy/UrTe+XnlsT
 Jg0Qeguv7PfsHuFD7HURQ6Iw6wUWYmsy33bP9SLPZlq0qBuNArVhqQrCfLFwHHj/w/m4WLV1Mc2
 wTcshbSDAh4nRThubjCHkUkMN6dfW7hnjJOGsWoQinmCmrhvDLYCyvg0mZm/eyfqj3KTSOwXuaf
 o+IygjVNwJDvZub25Pv4+GYOFpGEgRolalyweNiyLBSZl9ois5x7wPw3WJDm+di+PNwU9lkueG4
 ibSpNSd9Ns9eD5bpdzCCchI4mIV1FPtLapccjunmiumUx5j2jwRMbG5xZhiMB3f8AHyQKTK/CPm
 x6kYAe4FseT4RkKEQNGAnRwgwYptNgTe4HmYq0+sX4c0BOmatEpT/t2SyHY7JFMdV6BmkYpUqU9
 5pK4d3cPjly61bICHh6oZewKc0+58Ar0uCTy/Z8f+0v4MJ7KGW2HpgGxqi/Pbwacyf0BGuva
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=686c4be8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=bhy6XtatztNBMhLyL1sA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: H6kCBGW7ADrdpI96EM0Jmi7PINHiao-N
X-Proofpoint-GUID: H6kCBGW7ADrdpI96EM0Jmi7PINHiao-N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_06,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_153624_887484_E3260266 
X-CRM114-Status: GOOD (  11.65  )
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


On Mon, 30 Jun 2025 09:45:14 +0530, Aditya Kumar Singh wrote:
> For certain action frames like the TPC Report IE in the spectrum management
> TPC Report action frame, and in the Radio Measurement Link Measurement
> Report action frame there is a requirement to fill in the current
> and max Tx power of the device in the packet.
> 
> Add support to populate these fields in the relevant packets. Advertise
> this capability from the driver using the feature flag
> NL80211_FEATURE_TX_POWER_INSERTION.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: add support for Tx Power insertion in RRM action frame
      commit: d45d015448fcfbb5dde7c09f2b0dffe5d689e6ca
[2/2] wifi: ath12k: advertise NL80211_FEATURE_TX_POWER_INSERTION support
      commit: 93a1cdb9cd94c7b8a2aac33e4b13ca61d712f5eb

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


