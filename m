Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127D3C83F21
	for <ath12k@archiver.kernel.org>; Thu, 10 Jul 2025 17:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dg7JRVt95il8s/jz7TuZQeqrrUbBN3RXqv3GEYrwXmg=; b=eG04LkGpyndIE0bXmAb/DZHM+Q
	A/hn5GTDHn8IDcr6fC5bi0Z27pRXdoRLJwWO1mRkS7rnxB/hHkYMI9Plgff5yOly0gH6EC/hPz+BS
	tpE/iyW+ZYL07gEhEazI3hOFrm3oMPC+WdIc6A1ynRs/ZtCJJmHLypbr7p8ZWW+l2z6Zv3LxB9D1f
	BzOc4P0AJHGb6m5jJdUXJi2zKwWcyrisWS1CgMn4IvGFu02vScLHen9I83MjWD+WGeDPiEgV5SPC5
	MoEB66EpQU4zmMX7je/SjLqBSpBfpw+Rt4n8lwGMnzgi6h0tSBNKAjbNmBffnouSrZagZl8xMqw0D
	gPMMXCvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZv54-0000000CaJz-3I2k;
	Thu, 10 Jul 2025 17:29:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZsNk-0000000C8N8-0PE7
	for ath12k@lists.infradead.org;
	Thu, 10 Jul 2025 14:36:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A92wie016185
	for <ath12k@lists.infradead.org>; Thu, 10 Jul 2025 14:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dg7JRVt95il8s/jz7TuZQeqrrUbBN3RXqv3GEYrwXmg=; b=BASj/fjA2/M3JW1H
	Jjzwo7BNCShSOzIgYCtHAkZcjMTlcqsowPg7g4GiX+ES/LbqfBtw/eHMYr6PH7E+
	SnCxpFMNGak4XtwuQegrknF2rmDVrCVX/NSa53kTm1wMntgsbrHwAHV/S6EBh39F
	GY2ZV2+cPFsjBhBDnPdg3fYc9kh5GV+Pca77/sgmOmtrmvIVXsfiWOMtdfrXyyrq
	uljgQgO5HKl+aHGddRgCTtopYdi1Kb5yfOfITvts9Cg0Pcvmz+Kg8NxhhHCu18eo
	W5dH0tF81N5Bb26kpH9ATYQBos9pdOWfyuqtKpwI3gzafjGsVtxT1TGhd8cGHicB
	+jZZFQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvefrra6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 10 Jul 2025 14:36:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235089528a0so19201615ad.1
        for <ath12k@lists.infradead.org>; Thu, 10 Jul 2025 07:36:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752158173; x=1752762973;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dg7JRVt95il8s/jz7TuZQeqrrUbBN3RXqv3GEYrwXmg=;
        b=B65KVip+9zvlPhX9hUWLhJRaQorWgskBlDK1FF8AyelNrUGI6GYz+/MZ3cbVVSph66
         VIKRj5/djGl4zaxlXsC7qpOoWjNCzle0UMn8FvcOdxqFTNx9E+Bxg5OwIWVQ6Qcyveyg
         abPq2fgeK48IosDa1CBWTZ4QnNPMrY7mYxwYqHbXYdk+Tr7lftqykhxzyVKl1+A14jYh
         3sgE3Jqd8RG14It6p81gUc+DvZwv3X7eItP2oUHP68AaQRcyaB8QofbmIwindACnaTjm
         9t/CsCNuye0cR61Owpy6tCbXwZ45XWMsRA0Lvc+9kK8phL9qlJrSc8BPTGQlnKf3Xc1W
         F0rA==
X-Forwarded-Encrypted: i=1; AJvYcCWuwC5x1kf1ygC7HjRrfLzJrAW5tkEpbuOYx8cMz8SJ2nLM/5bvC6XqgvFPt4tYLm2zKuaiqlM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwPL6N6hSfX6U1sZX9rdBXXGrpecyTy3dvwQogyGtE5rpqSZl8J
	IPQrsAemzJk6nrXIzC/wPxEWKDn+Bfj/djbopMIIQl4fr9pusr7o11KxIv35cUQSpfAUndb0XXc
	mJQfEyikmYvH5NgnFRdaPeunB+vc4sDHHaYsMGz2ZMsPgyn/+EXbORv9IQMwzXUBM
X-Gm-Gg: ASbGncv7K+NfNge82KjHhJKJIh8q449OoJKrQqP1NcNAWukHHNcjb5pAab62zAyaoma
	jGisjypzFEHCk5YnVk1Pli27BdEsZoqI2/QoJ5otqWwyKtkQMBKokRg7LM4oGJeHDYRLFSQ+6Ik
	5U7uviOxkA8QEtXK7UNad87IRTPxkjWke/mx7S+3Dhtmrc7GrhwjAqf1e4DZESWHyK9rSFmtReL
	3vdr353pyzUPdiOr+pcVKnFlFvaJeURwk4Hfp8Ye1ElGZHA6eIXOm2elMJJJv/f3Pdia1DctqKR
	/HzDpXMLWP7GYiiue+HfbcbqhhqkyUbg35I+6gjTFCrjmuXQVYzF/lPRmJk=
X-Received: by 2002:a17:903:b50:b0:234:adce:3eb8 with SMTP id d9443c01a7336-23de2f7dcb5mr61822985ad.12.1752158173439;
        Thu, 10 Jul 2025 07:36:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7OiZudC6nBSVY2ndwLIYd90vpOrAhe8RwjSa8EPgDYPyCW0TtT34tHP6hcM40vgh3hSHMbw==
X-Received: by 2002:a17:903:b50:b0:234:adce:3eb8 with SMTP id d9443c01a7336-23de2f7dcb5mr61822465ad.12.1752158173010;
        Thu, 10 Jul 2025 07:36:13 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4359a86sm23758055ad.210.2025.07.10.07.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 07:36:12 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Lingbo Kong <quic_lingbok@quicinc.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250702-debugfs_htt_packed-v1-1-07bd18b31e79@oss.qualcomm.com>
References: <20250702-debugfs_htt_packed-v1-1-07bd18b31e79@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: pack HTT pdev rate stats
 structs
Message-Id: <175215817183.507672.13750771482128165327.b4-ty@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 07:36:11 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEyNiBTYWx0ZWRfX766bqGLI2Pl2
 Ffq46KPs8pPXMDQTongK98n8l3xKDPQ/w/BXEOuF6n7VKN9yEKZ9EZ2g6F9uprxvV6j3kkblzga
 e2IvvjjmiFrlS7oxS9Y0N3a993cE/RcutX8BMe5AJA+j9w15swAwVpoOYMoxpnI3tpPJZ+iwCbc
 L4K6DaMWanAWz9FjKO5nqQflAsyWR16cIGncI36mzFQzm2LwU7p/I3mnmbSCbvTObRNDEBgrMPA
 oreIQDe32tpmfFJoHH26bScKHCkpo+LD2LHAksAmJnbGyww2N9wML+MghfZekSsMBrKnVk9FOeX
 FMav3wvOWcVCWw3/IJqG5RYWZx7BIaoVciOjWOZIPlkWPNL00qiEf/Kq6BalxFmuBbMma497HYs
 DupjHtbknmoQlHffTP7DcCptStD/tsivgn7A9xaLB3av8qXSbGfD/GFfhr8uqfLj+2svdeeL
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686fcfde cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=UczwlVCNLZ8JH68BmIEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: m9yTlmst5mjSv_IjB9EGwErnr1KNjUCb
X-Proofpoint-ORIG-GUID: m9yTlmst5mjSv_IjB9EGwErnr1KNjUCb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=846 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_073616_252607_4B9F7356 
X-CRM114-Status: UNSURE (   8.95  )
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


On Wed, 02 Jul 2025 14:29:12 -0700, Jeff Johnson wrote:
> In order to ensure the HTT DebugFS structs shared with firmware have
> matching alignment, the structs should be packed. Most of the structs
> are correctly packed, however the following are not:
> 
> ath12k_htt_tx_pdev_rate_stats_tlv
> ath12k_htt_rx_pdev_rate_stats_tlv
> ath12k_htt_rx_pdev_rate_ext_stats_tlv
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: pack HTT pdev rate stats structs
      commit: fee9b1f6691120182136edacf590f52d62d9de7f

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


