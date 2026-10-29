Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C624606A332
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 13:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cgcPDqCT;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oRuQK3BQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jXshH3hm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hdNAv1DWvXXl8AhO5BI1RSsKl6nrZ5HKBAmEionbXos=; b=cgcPDqCTOlrTzvhQfTH3bxVcSh
	7+Pl3ni+fU79YG32MgfNOImc96I9f8RFl4mGEeOtnWwzNRRQc4Z16uiVyDCyUzhBh/2fRppU74pYc
	ed4n8fomUS73nSSV12uaSU0SywzF85ASwMjDNcRUaZsGhc/6h+ozk/82i+3OjEFTwyyfQaUcTQhrP
	0cr0wTEy8i1q9tMug0iUUsScUvokUimS/u5EOISgsPpqyjLO7B07U0fCTexWZ+UbKvbhvICfMlzLD
	R/IxicECdMDUnvvjNnTDg9O66VINHj9Z7cuscJvaxZlzLuWH3CQhhr1oJaSMssSgnj3D6Q2Ob0BDn
	J9R6Biig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQC3-00000009LZy-1OVg;
	Thu, 29 Oct 2026 13:29:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQC0-00000009LZQ-36bA
	for ath12k@lists.infradead.org;
	Thu, 29 Oct 2026 13:29:22 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCeUiJ3400588
	for <ath12k@lists.infradead.org>; Thu, 29 Oct 2026 13:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hdNAv1DWvXXl8AhO5BI1RSsK
	l6nrZ5HKBAmEionbXos=; b=oRuQK3BQXyzkGuOzxHBHr2ppzqgCEJD9XPLxut42
	jjOCo6h0q2c2DFNDa4hevb6u7QefiUicMYsGvkBXfyyTjOxGABnJrrJ891jpvkM1
	rojqN5G8A3YjgKjV5fkK729I9ZD7ef+MYbUf0w9K6ctPZ6SVDGkpESGaoBs9rYIp
	ZkpINwDT3vaFzak0hLqAOUwc5v5cOd3Ca6qcG/2gUO6MnpjEUmId4YYINe4AzQXI
	pHCt+jOWsAMALyr4RqPIxiUwK7heHmRM63xmhSnRZqLptZWeboFoSCcM74wO+Msu
	hHqFhtghPFFPkoGlH4A8a5/8ie+noqbAaq42ZeVcEZx6/A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb2c4cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 29 Oct 2026 13:29:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e601800e58so33655115ad.2
        for <ath12k@lists.infradead.org>; Thu, 29 Oct 2026 06:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793280560; x=1793885360; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hdNAv1DWvXXl8AhO5BI1RSsKl6nrZ5HKBAmEionbXos=;
        b=jXshH3hmDnp81GM6MY1HiTezTE6hv0UZvUPyCFV2U3CdSXNIFJHjDsev11bC8Dm6MS
         cO0uVzRuAAyZR/4jc3pV/aSg3tOH60/s6H5jINJ6h78pKMWZmhqp1oIzW0rn2oR/Bys7
         FXymPNPU8tvoORCNO+7VMWztpAEahrsylFAip25mhS5M8Ob99H0NpCDdVzhDIWH8TTHb
         gBOiic4ShQx/5G+5HJ4uTBH7eD6aG0P8Bn4T7BaRsKqYufnFpYbjezfn5PJ5souKDeiI
         cOnXmTeVUft3DiVlUZJW3HZnZDg2hT30pXb/M7OyTBI4Abkl6wuh3bSibrzpgniD/Igl
         vBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793280560; x=1793885360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hdNAv1DWvXXl8AhO5BI1RSsKl6nrZ5HKBAmEionbXos=;
        b=QfnbR4lmvaTCy9TdDa99Ffo4Uohaw61RGPxeWzCsLKbH4TcNHybBB86EPPl54/bC6h
         c0UgN3cF3Oc9vrWpGR27vC7Yh/XfS/Tw6ikZkTTBnevbzwUmPPNlvttsEMnYczpAuTrd
         OjF4ra8UPcxb7We7R3pRecLihE6HK5Pyg06X/qpgtr3aFsjVnv8d2LCFEXF+drCZZjva
         Ozlms2onN8gQRZnx7Gu/tisdySW8LcimvylfxV2IRVS0Ygj5rUjKUNyBlb51nvgpJsPM
         KaRn2gLvSPEEj3zsFg2lCJ9yDCO7g5Cit/+1ZoWyuNHN1yD3pK2dPGG3YyFCcQu4YtEH
         VwlA==
X-Forwarded-Encrypted: i=1; AKwUvByiR6htslgzfusTQ1WtBdILONkpFtLuyjUBQYNpfcTRbot5Nkwfcvu+/0TN6aGPiZpQTCqQ+5I=@lists.infradead.org
X-Gm-Message-State: AFq9FYLBw9cfsOuFb9q63ZIfGY8lixGdIOhwkBJueyggFW8nUQk4VshC
	xuTf6FY4xEVxj7qArQe3vJ0DPKdNLbZj7DhqbJRNYcBqHTi39JYbt8J/De72k4+yH+Op5jrVOYN
	kCe+o0o93+qQGaUKnsrZSUOWA4JtMgnwqORUVfmP2V8pdFsqJ9nZNI/PABsvGtFsH
X-Gm-Gg: AYBFou36rjCa4JA7NLgdzZuJyorwicL/bb9As0UPXi3lKQ1I27+mJn23jm4Kw5hROqJ
	bl7WSXQun33xQv9SYbeGek6uWOq8y8yfOjENHrFB6MU/xijShI5BWB9Ppeni9s2EQWtg8hTlmI2
	ia2e3II6gUNIP2WTDK4KRrZp4Z9XIFRLyA+UdnnKOZAe8dB5fu4oCbkiUrSXYaBJbbpsUHSxWG/
	s15OFQ0bNts3nmge+ZOTcyE5CyfmTGYzg5HNTIIg6PRxT10FBjAiAR/73GY+aKnME5TSxixdaax
	fGp9VQ1ZDa1+O1BHPZqc745bqVTZtSZqIaAXOlWFd3MCEoS/Sf2sLuIJ+KiWqeoV0s7Wn5A/dyM
	HRc84JMNZDOxdT/LRnVLz3qie5XmvBGJUCEcZ6B5dOMm2MYU/egzCSozQ91ElJVooZ5WKZsRCGh
	CjHr4s2qFoamdPs8k=
X-Received: by 2002:a17:902:e886:b0:2eb:1ef1:f055 with SMTP id d9443c01a7336-2eb1ef1fca0mr22399015ad.46.1793280559710;
        Thu, 29 Oct 2026 06:29:19 -0700 (PDT)
X-Received: by 2002:a17:902:e886:b0:2eb:1ef1:f055 with SMTP id d9443c01a7336-2eb1ef1fca0mr22398775ad.46.1793280559240;
        Thu, 29 Oct 2026 06:29:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6453e90sm34035495ad.1.2026.10.29.06.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:29:18 -0700 (PDT)
Date: Thu, 29 Oct 2026 21:29:11 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Sasha Levin <sashal@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Yingying Tang <yingying.tang@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH 7.3.y] wifi: ath12k: Increase RXDMA buffer ring size for
 default memory profile
Message-ID: <auNKJ88kK1_QTPTi@QCOM-aGQu4IUr3Y>
References: <20261029095541.685879-1-shengchao.guo@oss.qualcomm.com>
 <2026102919-confound-remnant-f133@gregkh>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026102919-confound-remnant-f133@gregkh>
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae34a30 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MGbNdRo_2CZBHlq_cxEA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 0UGUShoe4jFMs_Iyu4Z7DelNyJP5RNDO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MiBTYWx0ZWRfX3T0SaJAnVFbK
 FXAdbzUvYW/nx12itGxmJQzAMznJQlNCbpph3Q+IKojDjB21stKBysDsULfW1xM+JvoSsYXqTYm
 I9nQY5y5pjL4v9H2/lbX3Ta1NEFAmbU=
X-Proofpoint-GUID: 0UGUShoe4jFMs_Iyu4Z7DelNyJP5RNDO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MiBTYWx0ZWRfXzyfeVFXmNl3u
 gWpeOVSg/6gpEeiXIpkU0KFxTxbmAtnHO8dt5OdUd0kqP/dJFyNipwMQRE3R9IYzA3MTlKMyZOK
 epCXaJfjrAeBhaz8QxOhRO5aH9jQAkDfS0BHc0O/WT6Fhp6c9quBcr0wHx3c7H+erR1xv+Cwfk9
 k6rFlZdWy/QBi4AZwrMP5mhzLuNPZW0rzkLUrHZec/OBa810Nyw+xK/a9vzJq3uFHv+Z8eA8Juc
 LUZDNF3WT60BJ4rIih/v21sHU39XHMv51xO+Ek3TA5HwkdfHyoJThU2Mq9buC0wSVqLfqrn3PQ3
 P5M2STXeg8SL4ICm0augljjDDD5MVOgOzDD4COPq84NaDhWh6a+e5pnpPNf/xdQ5YhBspJqxGk9
 CcUSuZlA0K0xmBx+rCfVR0xDo8uDaXErqj3o9X3ir0cAjNPM0MUbWaNAMrkYFZ7/yeghywiIg/+
 giv6zWWRcDAZ4BePW7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_062920_783766_5AD60763 
X-CRM114-Status: GOOD (  10.66  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 11:14:27AM +0100, Greg Kroah-Hartman wrote:
> On Thu, Oct 29, 2026 at 05:55:41PM +0800, Shawn Guo wrote:
> > From: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
> > 
> > commit 15f7603b69a83a0acc7fcc8992ecbea6110f9424 upstream.
> > commit 643f0bf936176c114d5631da7547e991b5d99f10 upstream.
> 
> Huh?

Hi Greg,

These two commits landed on upstream as a series [1], which doesn't
apply to 7.3.y, due to missing prerequisite changes below.

  wifi: ath12k: convert DP_RX_RELEASE_RING_SIZE to inline helper
  wifi: ath12k: convert ATH12K_RX_DESC_COUNT to inline helper
  wifi: ath12k: convert ATH12K_NUM_POOL_TX_DESC to inline helper
  wifi: ath12k: convert DP_RXDMA_MONITOR_DST_RING_SIZE to inline helper
  wifi: ath12k: convert DP_RXDMA_MONITOR_BUF_RING_SIZE to inline helper
  wifi: ath12k: convert DP_TX_COMP_RING_SIZE to inline helper
  wifi: ath12k: move dp_profile_params to dp.h

So I adapted them into one backporting commit. I'm open to suggestions
how this should be handled.

Shawn

[1] https://lore.kernel.org/all/20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com/

