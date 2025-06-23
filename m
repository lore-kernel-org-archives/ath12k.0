Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1AFC7EE32
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 18:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKFnVpPG8HTPvkKizIt8l+YJVK3KOFx1p+k4g8s7RZ8=; b=lUnlvWoCEPVn3LBTvqE93djy5H
	SGx1PJawi1aZ9zUbuIbi+onG1RS6yRCNpAr0pragf1WSZKNLL2ejWLDJHfkKzpFrvucjp+PuAuIX5
	CVkEspBDQRKgo5XT6qQ2vVfoL2amHbwzLk0lzu1yWX8zrQBDw2Q8aVQJ+b6s8pfdSeoIvYVNF+VBi
	FfpYZQUnlKXM/2bp2he7r7t1qvRCEyoZhA31/lLJB04CVMhrBQrZU81uQiNMJXtR1leEtZ92+Dn8N
	JH/Ag2TRKnbDURGi49JPrPZeVd6MAYfVgLD/WOH226635TPW3CqZsjPqd0DrXBgXgD1wfFfMJhl8R
	UEzutsnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlzm-00000003hKS-1jPk;
	Mon, 23 Jun 2025 18:34:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiTc-0000000370V-32kc
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 14:48:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9TO04020784
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lKFnVpPG8HTPvkKizIt8l+YJVK3KOFx1p+k4g8s7RZ8=; b=BjpoQH3Ygey4coGr
	FvA0GV4PqzefvfTPgj625KJjeD4odA+98j4ukDKo/iMF+Q2lQHvQJ40+9wb3EyF8
	gzC2JfcD5KGCxwE/MS/3UsiR/SELWQ+Psy2JsJVX2DUF5SnHgWJkM9ANjTf1L8Nu
	qSXpokBsv9lVp9+jgkbBy7jdvBtZKJkS643CqXgMBKUiqvLA0k2zPK1q1+zGFN+V
	RYpUWzZMskMwEZPrgtDRfirepOLDdJCJvLL58qcevOVQLQIDP270hJ29t3SsOSq+
	K/UxIIeoUBSjX32QQpKyeHyg6Tizh3I2OlHHXANHhIpJx/cuoAngj7ReiVC67lct
	kbjZAw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3rvxd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:52 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74880a02689so3513022b3a.0
        for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 07:48:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690131; x=1751294931;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKFnVpPG8HTPvkKizIt8l+YJVK3KOFx1p+k4g8s7RZ8=;
        b=P1cELsKCGm+PZKCFoXN2cfBpfAgXEWAjZ+AdqVyQBJJ+qQHOmlWEkA8O5W4RxQolc/
         2XReVESIu8tvzCtfwTDG8jN5IX+HYVnMHAGHuCe8+ffWv4AQLNs9O6HC5wUoLRcWnEVU
         c2QGtNkiprCggrWXBdRPoq9VwnFJeY8px32krvwm3eJWnG00tWdDySaSecXY85sevOO+
         ogfpMrIEHIOi5a2GSKbfl/XnlW6JlKiSa+1ASsiRcfuiCv/NAODvEMJhDpJvm8SPCy1p
         oGoQZjkoGerhu//Npz6WIW1SbmFIAtwfrydmsy3Me5U29qw/hg0ifsvjQ+/idi5iw5a4
         mv+A==
X-Gm-Message-State: AOJu0YwqtwJm016JY3Lm5D3WX0Dz4/d5AxhqSYRnlJRUpUbVyrFJFtXY
	1LpM5S8S7R/NdhgJ8vCo2Ryg7BcCnzmgCy32CcztuoFXmXPtkvDvaG4vPjLydo9i2XyTAUi0JIW
	xF8fZsQQvwhstB5LO4lGs8v270Xj+eKhNv8QO3FOez4Edfx2OeMvCname3yRxYl8XhSgMAEMB
X-Gm-Gg: ASbGnctmZDYwAyIt770IZVfWnSVbeox/o+bEWeS5bX2MOReVfCYaxGqJoX/MJiCKhRE
	/D0X0v4pNy8cIbCgyyCM7AHQwLsb6AlhWEUhEBJ2MFlmpN+ibMiwwZlfqCYCEkqzzTueHU6ofOQ
	6s5YheDZo+0P7wz9ikrwT55mfOeexJWTID9r9AjLMSuZvUlKfjSjZlzbcHeNbZyn6OBRdXyvM8S
	TFz1QU4JzPfpfkJYLtq2NixsWoPAGc2bLTN2OYHZaIsH2XeSVe/CKF6U1IzhPJ7olmGdF/drqie
	pF0dYrZXtJlPlPPY55GYbBTa4mh9E7qTtoniTFCXvWzTjHzmdJ3CjdSim4g=
X-Received: by 2002:a05:6a00:8c04:b0:749:122f:5fe5 with SMTP id d2e1a72fcca58-749122f609bmr17362139b3a.18.1750690131229;
        Mon, 23 Jun 2025 07:48:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1TLoAfsG8g7WQiL1bRBHJ5wcoZJtBujsF7d9kvKZK5IM68dG5hKeC5CPU/pi/AbISDolnQw==
X-Received: by 2002:a05:6a00:8c04:b0:749:122f:5fe5 with SMTP id d2e1a72fcca58-749122f609bmr17362113b3a.18.1750690130813;
        Mon, 23 Jun 2025 07:48:50 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6d1eccsm8332894b3a.180.2025.06.23.07.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:48:50 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250606044936.3989400-1-tamizh.raja@oss.qualcomm.com>
References: <20250606044936.3989400-1-tamizh.raja@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Pass ab pointer directly to
 ath12k_dp_tx_get_encap_type()
Message-Id: <175069012970.3758471.16878237237153437687.b4-ty@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 07:48:49 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4OCBTYWx0ZWRfX/xuAsBlR/E8p
 Q5dA6+bpSncss4I+abo8/723ILdNmOOrs7Ko9wfj50uEUsXyoQqjiB7rfvtQ91bF4LLM8nweCD7
 xT3wpgfhyf5ZVA0bDZSH8nJPbntixKHjNpKFjOnzvi7nsl8PK+glzoX2dTjjrUWGHFNm/R0zaQt
 hyIKpRW6QtZPYzOiVse+p/+IYtaB2t/b44R0D1ccYlkY6w1UwiE36sjr1LxRm7nyhAO5UP+kr3o
 QFkUsaUh/07t+NxNj3bXs58FiOfaW8XnOZt5WnV5b7WDs698qc5wlSb4tLmRuWr1oJKkVVGx0RG
 rtEZ6MGIt1qJWVXi6JZTvj5J/YB/QDB1VTL//dqo6aHjcA+19jIjfRnelYPSFBHdbf5IuyALO2p
 hKVXzUuWt06EpS6lbJLZwwNG8QRCMTn9Fz6eQnC2DErZcJ/xhlunv9JhZ8LUszErs9Rn65Ou
X-Proofpoint-ORIG-GUID: phmFug8owRa6QNtbez9FPNG3DTDjpSSV
X-Proofpoint-GUID: phmFug8owRa6QNtbez9FPNG3DTDjpSSV
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=68596954 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=pPNxntyw70oWO60yalIA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=843 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_074852_779608_794F22AC 
X-CRM114-Status: GOOD (  11.23  )
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


On Fri, 06 Jun 2025 10:19:36 +0530, Tamizh Chelvam Raja wrote:
> In ath12k_dp_tx_get_encap_type(), the arvif parameter is only used to
> retrieve the ab pointer. In vdev delete sequence the arvif->ar could
> become NULL and that would trigger kernel panic.
> Since the caller ath12k_dp_tx() already has a valid ab pointer, pass it
> directly to avoid panic and unnecessary dereferencing.
> 
> PC points to "ath12k_dp_tx+0x228/0x988 [ath12k]"
> LR points to "ath12k_dp_tx+0xc8/0x988 [ath12k]".
> The Backtrace obtained is as follows:
> ath12k_dp_tx+0x228/0x988 [ath12k]
> ath12k_mac_tx_check_max_limit+0x608/0x920 [ath12k]
> ieee80211_process_measurement_req+0x320/0x348 [mac80211]
> ieee80211_tx_dequeue+0x9ac/0x1518 [mac80211]
> ieee80211_tx_dequeue+0xb14/0x1518 [mac80211]
> ieee80211_tx_prepare_skb+0x224/0x254 [mac80211]
> ieee80211_xmit+0xec/0x100 [mac80211]
> __ieee80211_subif_start_xmit+0xc50/0xf40 [mac80211]
> ieee80211_subif_start_xmit+0x2e8/0x308 [mac80211]
> netdev_start_xmit+0x150/0x18c
> dev_hard_start_xmit+0x74/0xc0
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Pass ab pointer directly to ath12k_dp_tx_get_encap_type()
      commit: 05062834350f0bf7ad1abcebc2807220e90220eb

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


