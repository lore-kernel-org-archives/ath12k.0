Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9B8CAC5A7
	for <ath12k@archiver.kernel.org>; Sat, 20 Sep 2025 14:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KuVkgYir3XNP9uZ6/co9rkHLCCHI4sXn2YnlbaAk8gQ=; b=Jecooq/r9iDukO+wOwaLO9b8ZM
	ljotKdj4cs07nVuQNod/DgxxnBq8TMpgRautlt2obu5AsDh6iBnvhmooFs9+zKKfbj+Qx9PleFBLj
	qUvfd1xVE+w8Qvl5WiqACiSIWTMfvsfkUyhbWbJBNq2DoTRrCsVz6f7RfpOIhhfxISCqlhLZKHQ04
	Rbl4VOcKisAzBLse3D6pX5TtUzoCll+gm0J166QSzS023unW9j9W7YYaXg64RQbXw/e1OhpmZdMVu
	kFPQCeSGqAEMD1TDkic7gToRI0CxgbQixVyPlbnvECUFkaPghvmCbPvxNAYRUCCBI3otVj0tOnXne
	SCHZzx0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzz3J-00000005UlQ-1Ren;
	Sat, 20 Sep 2025 14:59:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzz3F-00000005Ukv-48cR
	for ath12k@lists.infradead.org;
	Sat, 20 Sep 2025 14:59:03 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K7T9W1019208
	for <ath12k@lists.infradead.org>; Sat, 20 Sep 2025 14:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KuVkgYir3XNP9uZ6/co9rkHLCCHI4sXn2YnlbaAk8gQ=; b=K/kIlhJK1mSytMf+
	vetoxUufgF4jqKlOvjhHPfsetuVIeBhqrEO+rL2EI5mof66GvWLzyHEJ38CEXBRk
	GqQf1f801Wxw34rIRMUPv4U/c31+DHR2LmNxEuYPpKHFcGQvh08ivfq2sOo9qMjg
	5OaHcCMnf5SfTrrbR/eMQlRcUrpaxNYEWvjbqLeB3XKjftiswUK4I4jQwG7Qa6Gg
	7NW7sAG2AY3dPbpZBkREhrGZer+XAIP4tSYE24F4p1Jt51eNvlM5XpIzAEOehuzs
	9jZcLbNy4Q7fy+28+rSbWS1IhY9NA2HeF9pyuxdXhabbRiG3iRe6IbsK+wEnBDxu
	oEBBAw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1f8s8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 20 Sep 2025 14:59:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2681642efd9so26860655ad.2
        for <ath12k@lists.infradead.org>; Sat, 20 Sep 2025 07:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758380340; x=1758985140;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KuVkgYir3XNP9uZ6/co9rkHLCCHI4sXn2YnlbaAk8gQ=;
        b=JyyVWoUIKk1OkE52S7Gl2NBbfb08Wf4W8Uwc9w/DheFqmnsfsmp83WGDf+AAoGW4i6
         lhEd/WJpTELxs93H23Uv6Z04msbvkYaTqkNLdX+HSbbsDRCE1tc/tgXjuVecy2ge7EKK
         iimsiMOJRwSDsfmymFEg7cgQefXGg7LVvCpW/tHJT5tt+pBe6rRNny9XAcMP65tJ40J0
         +eiwEBiJZ+Erv87NIRu8i1p2YNAf/G8tbWqoojj1yTtW+eX3yQsHFWAtZ8PEa0+wguiF
         xFT6jk+ISInLp34hozz3AetcTuVJkFUBdSK3a0txDe+H5PF6gBTFdBvNDJ300VDtyoyR
         j/uw==
X-Gm-Message-State: AOJu0YxnDOLEpSpH2Kjt6OvX/AftFGa69DbGYpXK9XZBtuUgDWe23f6F
	Q9R5CcREhHhKoGvGgxt7K3jaz0jU549ObtxYT3iedj04QuP3xjMcnoCp7S2Z1TOrk8gBKjsgauE
	ZeNZb6bWWUVy/YlJZLsur+oEXYDOodzcA/y8SFfhoI+kaNsvYTDSiuDaPzOn/IjTP
X-Gm-Gg: ASbGncvuqWhO4/ORcs2I9LLSI5nux0PeVXW55157BQ+c5q8WK1TWS1F5MBLGXjPupnr
	lGm5ceaMXcucHQ/3cfvvH1/ZP9lXIx8zUHdbO71hWu0s0i4QL4Mb2bGL9T7U8djMtimB+mBqyHQ
	6h8oJLk2T1t6tlkHw0wTJwkfqIHkQZxcXTPLuW/7m1tj0t1Pnj8XWHnBdZYUA1e+1mC5IfJ5fFj
	XQCZulYxz+2d0PfN50jKA5KytLm9OrKAtlAMGAN7+h7uQoYtIAN9UGyd8fonfUGFxJMLbkc0OkJ
	2lU2W/yWq69GA+WFcReaq8pIkUXg1+3Jwqlz6CGZYdTV9ifbT9MZdZm1nIlWN5FdEMJiWcw/8QI
	A
X-Received: by 2002:a17:903:4b04:b0:268:14d2:8748 with SMTP id d9443c01a7336-269ba51ed09mr85839875ad.44.1758380339887;
        Sat, 20 Sep 2025 07:58:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEErKisgrpby1ggUMDrrdDWa6JrHCex884ZPc7njT/ykZ+AHrYTPGBfwvt5J/jMfiVxaR/xUw==
X-Received: by 2002:a17:903:4b04:b0:268:14d2:8748 with SMTP id d9443c01a7336-269ba51ed09mr85839685ad.44.1758380339387;
        Sat, 20 Sep 2025 07:58:59 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802dff50sm85198925ad.85.2025.09.20.07.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 07:58:58 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Aishwarya R <aishwarya.r@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
        Hari Chandrakanthan <quic_haric@quicinc.com>
In-Reply-To: <20250724040552.1170642-1-aishwarya.r@oss.qualcomm.com>
References: <20250724040552.1170642-1-aishwarya.r@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix peer lookup in
 ath12k_dp_mon_rx_deliver_msdu()
Message-Id: <175838033844.1001242.7090157541392245370.b4-ty@oss.qualcomm.com>
Date: Sat, 20 Sep 2025 07:58:58 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: vPxWuAegb4xRdpNtOu8jwmS4P3PEeXaS
X-Proofpoint-GUID: vPxWuAegb4xRdpNtOu8jwmS4P3PEeXaS
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68cec134 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=K65mQHiRMMjqrrAT7w4A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX3rM4V7CvGJla
 otK5PvAnN/N/Ayu/l/eMGseYu3yeX4FlkRLfR3W4OohWAlZvJQQQNn3Ywa58CE08DqPQBUD4ceA
 PO49sx1fVG8yr5Kxn1haDPbVqJ2Gm7wzTXTyaqDDHi6iEfJMFCousYAG14ijJeEeYgPZtVZmU0q
 BXoWif9wc/QzIpJWc8N7xmSXZL7MkZ5Idv7SwmHyqzprdDuQ5evHJz7pIkCRzaY41a2xvHyr1mT
 pXANCFjJgqxj1nKDaYLZzi4gx7TbocSPXi32sF9AcvjaT9nn4TYoXoXY8Wi6Esg4b8FK/5qtzeZ
 dq3XYbya51eW0jelm37b6z4AnqliMxnnnrrv43E3Glx1co+0/LJn0u97FkVCMrqIdYSm7XneIwk
 uEmeLsj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_05,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_075902_057789_F3867714 
X-CRM114-Status: GOOD (  11.06  )
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


On Thu, 24 Jul 2025 09:35:52 +0530, Aishwarya R wrote:
> In ath12k_dp_mon_rx_deliver_msdu(), peer lookup fails because
> rxcb->peer_id is not updated with a valid value. This is expected
> in monitor mode, where RX frames bypass the regular RX
> descriptor path that typically sets rxcb->peer_id.
> As a result, the peer is NULL, and link_id and link_valid fields
> in the RX status are not populated. This leads to a WARN_ON in
> mac80211 when it receives data frame from an associated station
> with invalid link_id.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix peer lookup in ath12k_dp_mon_rx_deliver_msdu()
      commit: 7ca61ed8b3f3fc9a7decd68039cb1d7d1238c566

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


