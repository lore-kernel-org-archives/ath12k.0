Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727E4D2F339
	for <ath12k@archiver.kernel.org>; Tue, 13 Jan 2026 15:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/l6Vz/ROV82wBBkFLcsuaWf8YScYkImEeK2Qy9YmyQ=; b=ZBPtXtbbgj3D6hlf6XXXoM4w2k
	F3DpbkCN8eXdks/soiraRqVg+PAPVqH6K6ctsd9QOsGtZNOUP09xXTEwFsx9Bo0ZZTfcCo8WSm+rP
	S9kAcmYJE0Y+DUE8tgEwSopCH3RwABKdcEZBw2rP/rewXkBMz7yJiIg5hv913HA/ctQsURvcTJz0F
	r2WmMIk5aiJ1W5DCdQhKrIQRuaw9RygWdhoMekCTDrzMKpLCfb8cYMNeI0oH4XZUtVikOPugvUBe0
	WM3Mh30rIG01pIA9s1NhNRD3FyZM8vDjQ7o2hs7eP+4Dx4pRnSTRjZC932+Uyjm/XzTDEWKD+N5hu
	A70wX5IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgKp-00000007NK6-0mTx;
	Tue, 13 Jan 2026 15:29:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgKm-00000007NIw-3vCp
	for ath12k@lists.infradead.org;
	Tue, 13 Jan 2026 15:29:30 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DEV2q61937911
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 15:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j/l6Vz/ROV82wBBkFLcsuaWf8YScYkImEeK2Qy9YmyQ=; b=Y98Zc6MfQ62NYWG0
	WCdxT/b6f6quiJ+6a6Y7UPYL4MvsxdAGIOD5gdWT0rqAwpbtUlbUE/RAvWxjmQ/C
	8/QZqPxW+XDkiiWIXORBEiR9KMktWrQeBXevgTdOweRfdNcZQ0rK3kxpK8RDhVFo
	efGBlW1DfsBmr65OiW2ERUZLGEV1eLcCCV3RRil8KipyuaaD4iaTfCeOGLdvba19
	z59kngpGX6LFkIGjNtOVeGUpFa6WIqmXFSMJ39CAa87TU3/VGhEdEGWNWpEViitK
	mAy7UmEgN4G9u/USxG8pt4EDzgHcuL+tiYjWWmo4cfYJg2j3YbhS7Gg31JzJtai8
	10RZ0A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6cnkegn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 15:29:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ae29a21e7eso4544499eec.0
        for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 07:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768318167; x=1768922967; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/l6Vz/ROV82wBBkFLcsuaWf8YScYkImEeK2Qy9YmyQ=;
        b=e9UocoU+w4LPU66ksnROqma9uHYH9JFkMmOFMjxSKvq4YLxUVMDx3dlNMIEkSLZVzc
         u3o4TJNebtC2kYM+4TwHrRR0A+TjM0sqolOcWL44zaiY7WXesH6PYiukzLk/ICgaTPka
         /OrRJKA5Oep8P7IS4qNtZ6YNpy46DvXM5WHsJXJLN6vZUnPMYyrManSeY4ltqWc28MMT
         2OQMXYLtuFPDsQOZusmmmq6VKXFO/ChXQeG6WbrrzwfoUJxQzwnVySm0M9AM8clF+3KW
         8/Vxpmh3yF+d6T9CYtq4t8ZD1o/Tl7F8Xjg5Am8ujdFMykS15gKIRupFo4DoaGVS3+7Y
         Fq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768318167; x=1768922967;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j/l6Vz/ROV82wBBkFLcsuaWf8YScYkImEeK2Qy9YmyQ=;
        b=ewSx/DosE+6s+UFjc9oHnPCzUVbuj5rIs8qCIH/fNHsYwrxaRAh+/S3Xh6bJb3vzsl
         3rI1oLTLB45naOUi9BgDleCFhmVe2eqvfYqLfKjUskrDj45Bfh3fOZ8NQUUL/7KkKWI0
         a1rxAsrGqj8AoZYWGqF1L58rOVap8z5tPVZbxJsAyqpg2Th0SJknxKi2P5bigaYxrq7V
         0IctTxoabGbRBsiU+yBb+vtIBNJLlX9leZrnFO1qkkftBiGNWTVGUUd4i1fx13H9vEXU
         IXeW3GfqoovOpF4Zk1Zdyle4q1w6NWEroy5pJGa6ogwhH5jGyNvlghNfrMRl1x5EtogR
         uo4A==
X-Gm-Message-State: AOJu0YzwLlg4pfj6MgcCTHpB5nvNdmcHzD6tsHxGmcIWBz4U7tvMU60u
	RbsrE8+oszUdCMZQe41xpFX91cHTX4bgtx4dih7vdAVBdAJqTD2D0AqHlZbSeF9gWiq41HgyJcq
	1Qqyr1SdM6wpNA0Yr2wPWYg5JnDaDMsJOIscbQgWpI04/Dq9GjzlnVbbyCp6nPd3qvnT8uPzI
X-Gm-Gg: AY/fxX43lvgTNYOZ5DmvoVUgMJsYDn/zsjIMM4tMNFx9ACCtkm+gOmJ4IwGlTLiyGFB
	0NX+xtjJ7qlhuGBsIX9KUszFJwSqh92AtUBYQbtbJ1bEwxZl3syR4U4I4DlAldTra7GP+/Y9SjF
	o+vWoB8k896Mgs5cV4majjBlTTScSshdEZe2iG/3rGFlSxUbHDhHtIjSgvQwCmeVCoWyDmNRZcF
	5LxR1t1RGaaRhpVh3hfHSMWkosBzA8LNgsSB+25kYqKRpasA2iE0FL5fDS4TXDMBN/9+JwM9e0S
	BtnTqiQ10Xu9Mb1YiLPUkha6Qzm5ZvBUvdrRjY7vTjHREMRR2KaHj54XgelgpnGcoUGW6WHcgY3
	cwq0C125vrqz3BmgL1CRJUHL2W2eqlNRTTIXpTmRwGh6AAldkIEtr93FKfLhBh3cF
X-Received: by 2002:a05:693c:2a0f:b0:2b4:7d0d:9bae with SMTP id 5a478bee46e88-2b47d0d9d4cmr247368eec.9.1768318166633;
        Tue, 13 Jan 2026 07:29:26 -0800 (PST)
X-Received: by 2002:a05:693c:2a0f:b0:2b4:7d0d:9bae with SMTP id 5a478bee46e88-2b47d0d9d4cmr247346eec.9.1768318166076;
        Tue, 13 Jan 2026 07:29:26 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707d76aasm16858049eec.33.2026.01.13.07.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 07:29:25 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260107-scan_vdev-v1-1-b600aedc645a@qti.qualcomm.com>
References: <20260107-scan_vdev-v1-1-b600aedc645a@qti.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: cancel scan only on active scan
 vdev
Message-Id: <176831816518.3453943.9391616403961545253.b4-ty@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 07:29:25 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: ymYTrumYziVaQE1fEjs-9V6fzYjIfxrB
X-Authority-Analysis: v=2.4 cv=KK5XzVFo c=1 sm=1 tr=0 ts=696664d7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6eCcPrk6fTqf2FKRD3YA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: ymYTrumYziVaQE1fEjs-9V6fzYjIfxrB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyOSBTYWx0ZWRfXybgiCqKneitM
 S4aIJMGuX6wrK5HVE6su3KGcEYXBggenm7WOvDVgHWCMYw6htrGNiSP4KkEP9amISoE9Dpg4LmA
 LyXFZMeSgARUaloK3wWJ0je2B+ntI/5hGYmUr4U99AwRPUNyn2eN7WdPjH+BgMLtxV8YGglpV+J
 ode/mZhomMvl3Yux/u5nBEHMf2tN9DKRCdrIWhDRloPEa2dwAITjroU63kiWI4/5lgEZMCpBcKg
 L+2n9/CBKbab0RsOLpNpuhf3jqEu5wHoY/2+G28F32uYoRf3oyQ95VGAxgK28VqNdqXdWuE2Jdn
 OxwZ3Mr8Wql+Lhl5iREAorr+4D7nV42yCvIYbBPkxNg1Ok+uZgFyu5aFQh2Dqr44BGtL23wdbd7
 NSOie7DvxwDMa3ooUwU5eeulNz0tCA3ojUQuBIuas/ElVgNlv6ld3sGxHLdUmSuukI6EDjZ4ilZ
 GC/8uzcahO4gUdiRYyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_072929_110988_DC1E4D2E 
X-CRM114-Status: UNSURE (   9.33  )
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


On Wed, 07 Jan 2026 11:32:35 +0530, Manish Dharanenthiran wrote:
> Cancel the scheduled scan request only on the vdev that has an active
> scan running. Currently, ahvif->links_map is used to obtain the links,
> but this includes links for which no scan is scheduled. In failure cases
> where the scan fails due to an invalid channel definition, other links
> which are not yet brought up (vdev not created) may also be accessed,
> leading to the following trace:
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: cancel scan only on active scan vdev
      commit: 39c90b1a1dbe6d7c49d19da6e5aec00980c55d8b

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


