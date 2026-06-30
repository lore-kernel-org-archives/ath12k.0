Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2262DC43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 21:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dU0o+2l8vSV1Dy91oKNMoT6ECd1McbX7tc5D01UR6xQ=; b=f0VnP2A9h7jPduc4z3pYUGPC5R
	IRpPh6Ybll8jG2E9WyFgbX8hLX7AQMW+cYSZ7xTQG1rrIlgHBcCBxFqYV69vs/eEGjI4sgzOA71bK
	e8wXR+my0eRFrBrPe3NcCOymt25qUGfa23PujrVlLQ+vlp9kIVnmzZFL0ZVcfgjfmHLcRKhXVMh9h
	y4bPtToGHKCO/8uZ21KsViij3WVZ47eKmlYNEIr6ZlJ6sEYQj8xt1Nw9vjbtI6a4UqLrK6CyvWaBC
	IvPKFhJnW5Td9LsmHdX1cymoYfK7UnrUEZt6tIylSNfAdbiYf2lm8b7qqsNCqMQxbZSLpU5q2iCdr
	W6mdzcLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefyx-00000000F4K-3dq1;
	Tue, 30 Jun 2026 21:27:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefyY-00000000Epb-0WP1
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 21:26:46 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDc8Y2873527
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dU0o+2l8vSV1Dy91oKNMoT6ECd1McbX7tc5D01UR6xQ=; b=mb+0K/O4ExwJsgjE
	ncrUrVaXobD7FlWZ5kTIY6Ucb0NkszAKvbtN8Hhpcznr5PgMlp0YbgBbNwwfDr/8
	uQjTkcEdIsibApGJKblsMDNk25YMofkHGCCzlPTxgZf3xkX5ZbrSNPKwv2Ab0rpI
	CHq1RzPNiIgj1GeRx/WKhDmu+HIvM4LCFt6kHa6NLr73KpLnbqKp9gUO/OjD0uvD
	uMVc2ROFA/zj2gLAV8/1vDdGyUfj5wJkRC7yxyIyuv2iK7OxTcFU7rNMNL1HlPVD
	I9jGhgxAEYcXWLNdqPoyWElV2H3/+j0tPa3lkQ3YzxBKTKLdxus1NiOEUm5LOqIX
	6IKW6g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3sgpyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso5881902eec.0
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 14:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782854797; x=1783459597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dU0o+2l8vSV1Dy91oKNMoT6ECd1McbX7tc5D01UR6xQ=;
        b=NnExwVDTox3m5YwOXk3wlYJttupDqdRZiHmioLSH+dz3A5JgwfMBZ1/GS7NFUzc/5t
         /Jyxb5CtFkbv1OJUfhyqWBQsl26qVrUB2xxq+AmmgRHX8lccy5PCF20y4+CP3BfhRpGp
         RPgDSn0GetX2sco2k8SxOaQXI6Ty64gA9/Mn0rzIC0jLKiPCq8GDbNjRVpv8SELTIcwb
         px6Wi45WnNXnHgQcgCjHu2iesSiOxcqiyRX4A1HxsjkEVtZnKedaqTlJk6AcU7d1B11x
         mb++X6wqBvDSpo8CrTuMH7qBlfPU/uGCJ7xP8XRoGlcc/bOyizc9kbjWCC+0unXbC1Vu
         txag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854797; x=1783459597;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dU0o+2l8vSV1Dy91oKNMoT6ECd1McbX7tc5D01UR6xQ=;
        b=dn5tdRkrIcOOudMKyh5mpWYCAOyjIUafuFrVKP5C0ECE5T6zpnt3iL0jSODI6NUHUJ
         FyFlXZ7aZ3gPX5dGDR/WvdBjG+cU7iWKzR2bcsHMdDIu6XaS4uKt9oJYAGO0FnxPANjZ
         rFhM6Z+VFWGre6emtOfK8oe5W7PnD6N//vlOa9mxrD8o9/E9IZZn2uCpQsDeS289uEJn
         +QCA1jz5gDqVwQuhvSA3fzbXzw4GSHJrpH9XNig8+qoSrdBfVIvF9r0JjWSP5w3ZHlOz
         gHS4VUF2Fd5ti+Vd9o8rVLV0g30QdS21NRmYZhSaYWimpvFXqyeQMO5Anqd1VDRefvYv
         MFeg==
X-Gm-Message-State: AOJu0YyeWuAvofZhqkFeaEj1YBD1jMBbZ9xMae+lkFoKD5rltmBXB7BL
	WJ4edFVsuGSwmKC0efZw/T0bIgThA7FPIV4+t7tCnuiKNa3Gm3MctmUrBLTfhoMKNCKnbTpclKL
	ewf63/cunrKkiKRQ/fkH5oTQ/4NE3UNGfU2JpRyDNGHxTvIY3iPnSSZvbgoQaSFay
X-Gm-Gg: AfdE7clWFRdTRH1xR9ihR8VMfKy205IbrbkdzGjU9aaPwWmmQ/0hhsOGBJG9J04xryO
	GVioJ69CDQUNtfwx00k9g1lwT/IgEYfhGq2EgADbqFeo1BQrt8DQMziwItWpeGiQCssvsdAYit6
	6YaBcR9yVlBXjUYOPyZEG554DKz77nW1MHIf8Gru8J7uLz8P0DEyhb0TGoFKrTyngK9c237X5mo
	nnlKOF07U44foH1+RNzHGJcS3lYO4B6sjO+E1haWc+T9x76wXJ2w1y5DO00bp5Z6J4LdpqStpb5
	3URTCigQrlvM966fYIZeDlV3FwVtXHBFom3VXAdx4JV6Lm3w4zX8+27LL4JtzkU2q94SkJSOraK
	xN9lFMJpUK0GIfpNROA0J4ZacLRNJ+WRuBI1HUFnjvwzS5AdwAYEFApB2+L2i8e8IiA==
X-Received: by 2002:a05:7300:545:b0:304:bce8:fa30 with SMTP id 5a478bee46e88-30ee11ab946mr5307232eec.5.1782854796946;
        Tue, 30 Jun 2026 14:26:36 -0700 (PDT)
X-Received: by 2002:a05:7300:545:b0:304:bce8:fa30 with SMTP id 5a478bee46e88-30ee11ab946mr5307200eec.5.1782854796382;
        Tue, 30 Jun 2026 14:26:36 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee300b286sm11604046eec.12.2026.06.30.14.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:26:35 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260623100501.2100119-1-tamizh.raja@oss.qualcomm.com>
References: <20260623100501.2100119-1-tamizh.raja@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Advertise multicast Ethernet
 encapsulation offload support
Message-Id: <178285479567.1590147.4813798296880347761.b4-ty@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:26:35 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: xxoGsDAIy-wMmwdUPsf8jXd0hrza4t6Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfXxDCjzysjl05j
 5D1LNVXtqtCazojcBLvLU+4cp7/h58pgGlGOcFKJTLhz5xR7Xc4fKAxNNHisEbrwhiExUNJR3QF
 9s/+Ut6CI45qeSdEqJhVGVFsWZIVKS02MYMX6oyi15VwJGFIt+geRWRcNwwS1LW+YinINckKEZf
 GR6blq6SQPUZ/WFN0XihL7UWkV5LeoTmALnfHG22OZe+GaMhYv0P5Rq56VKH2G0FDN72Z2yrthT
 uvjeF05telhfTQ0LFb4LpDC/f/4gQqhAqwh4Vpxd1JBhBBYz3WhkNlQVkxAleGS0uOqzMxFpM78
 X8AV5QLiyG2I0h4e955rQyDLWfY0HRj8nDWaZTaHFqY/smxLQ7e9IJiOCVl5EaCq2MS5jp61C7j
 /Zug9qIRqA8GKlrDWQ8MpQPq88+blPCRrebWQhzAC6xSLe9Gic/XhFDQ4TJUaDM+swtW4auxOFH
 rVXKNv0Vv+9npRsscAg==
X-Proofpoint-ORIG-GUID: xxoGsDAIy-wMmwdUPsf8jXd0hrza4t6Z
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a44348d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0vawpYmtxxF2E-qvgzkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfX40K+WsyxMH5n
 16z+wfXXuNz1GpZF+atxrspDbGMd3y/xQntBJZAK3HhkOP04RrshsdKVqjThuBegt1euvNhY/Mn
 FJplbIHY2BaWEfi561k2c0zmUnLla6o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_142642_538099_E62BBA75 
X-CRM114-Status: GOOD (  10.21  )
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


On Tue, 23 Jun 2026 15:35:01 +0530, Tamizh Chelvam Raja wrote:
> Advertise IEEE80211_OFFLOAD_ENCAP_MCAST to inform mac80211 that
> multicast frame encapsulation is handled in hardware. This allows
> mac80211 to pass Ethernet-formatted multicast frames directly to
> the driver.
> 
> In ath12k_wifi7_mac_op_tx(), refine the logic that selects the MLO
> multicast replication path. Add a sta pointer check so that only unicast
> Hardware-encap frames use the direct transmit path, while multicast
> Hardware-encap frames fall through to the MLO replication loop and are
> transmitted on each active link.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Advertise multicast Ethernet encapsulation offload support
      commit: e47d6c9bb4165721f61356f5fccae8f7dd78876b

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


