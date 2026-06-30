Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84448C43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 21:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33L9NYOV6pllzBF6e2bYrYWI2ExNYhnVZGJ+dAvs+s8=; b=Oa+Kbx5RpF3XU46QIYHGTnedbG
	zk1udqBEg0yML1zsuZ64HrzMLzZ7D5tNgvXL9H3WUhxUrc1VJ9wwWW0KnKDpO0ouykf3vNX4d5ZJS
	47rxPGC/oB6VPlp9a9JEcPfuAVa50FnOJb2bqh0foIZuC83QDsjosglcvsafr9txyKusxiingU4lr
	UyJ+phzWH8J+KmKakp3UaMqBS48Zf0ABJc7aeMO1/2xKYDk+2rMrnBfCy3MPnKZ3ehHKj1XDIZqcQ
	HQ/ztgLKpZ7kQsIUk3zZx5tcaoEv3fBE7ci/Q+DgpjmPP7cjKfQaeae6MgHqh8M4LBupVipyTUlWC
	D2tdDQWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefz1-00000000F6B-11kh;
	Tue, 30 Jun 2026 21:27:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefyd-00000000Erb-2yer
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 21:26:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDXHc2948414
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	33L9NYOV6pllzBF6e2bYrYWI2ExNYhnVZGJ+dAvs+s8=; b=YPjfad2wmJFKCaEu
	7YNQCeJwIrjyrmEkz2D77WNbT+pHiOIrDGzB8A18ywmE8VTwzI2+T7hiwgBZXtxI
	6n6P4S7/pf80uZYlCinlyjnxuWCgqHS4RRNWaGzl7mVxtiKL1UdKaSpS4GxwZkFK
	Y5efcHPK6NLg31sIPwezliq8ol6xO/zFKbHLoKT+b5yOfpZ9r7XAKWg8l2XRNxR+
	SfGBYqRIsD2vyaFWCViDh2dJh3uPDvq4QTYBFT4vdGkkMGgwM9J4T41rufYzydVH
	oG6NXs5GN84DLb5HX6szzsuL3LWdP/ve0firjPPldaDweAbvATwqrk09r6TS50Tk
	O8lVHA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw0k1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30ed53abff8so2686445eec.1
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 14:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782854803; x=1783459603; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=33L9NYOV6pllzBF6e2bYrYWI2ExNYhnVZGJ+dAvs+s8=;
        b=I/TIFTF5c8nMbq+J6Md04Ep0jsYeR2qwP+je2wvwZldlHm/1TPIAPRSSHC9xYnIQAq
         rqjnocLacQb/jxG43VYk2cKPWj7MRhSwm0Rc9a1GPSZ74RHq8HEc1lwp3PSJZ17GeuuL
         86MxdJJtcn7fNW8Cq4ub6euk5UQylpZp4RXCl4XzEZAviW22Q28ffDaHB5V7hkKArEE/
         7Qmkr2YXzk0V2sKW/WenadwSvhSkAMbe4bP1ZkAvCHwJ2oPYHFOWRXp9tI1iP3Ko2kfo
         BvqLwFlYF9hlHp3IGSZmBpqwdFthhXEDpBn5SCiB9sMfKejdZ4TvB86kO1G7wIjRaGCu
         wGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854803; x=1783459603;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=33L9NYOV6pllzBF6e2bYrYWI2ExNYhnVZGJ+dAvs+s8=;
        b=f3PO7EzbdF4lJP4a7yNuQYbGTyJbUglZ70AQ2xueGUwf9iwlWWp1vSScPKk5vBxjDs
         PsQgHcRi0ovl9rpSlLGr/uaxynjvP05IDbDPC7GaKOE2mrWt9BXEdUh1Z8uMLl0uLrkB
         k993+Yl35O5pYDii7jrXPsPp9vDSTu9ZjlO0fo/yuy6TewLqPJmbBWg1h4qtssr7nTSk
         e+k7b+CZx0riWQB1M8QMK2WCgJiEQJJcjGD4bAd7sCfae/3xw9c1+BJZ4e7DEFaY6m22
         5cuxmm0USEXcTki7OGLPge4diDE7DhwUmgtyjryciPxPFxY3qnaA16oGY9eapuD1UQ52
         xJvQ==
X-Gm-Message-State: AOJu0Yx3fzp/mfQWTdlkqM8fC3yin1/p1CKT8Ebsss+WmhawKwe4Adcc
	L//eRwWqldP4v+zaU2/NaWbLYxauidh5MCBbmCaLpE6Fb+5gmgANXdrSAs9kP38pQB5NQ13DzuR
	qkXcDUfaVsdU+DxVT+JfnSAnCYLG42D59Hrsy0DE6oH5EiHlLWRIJzH337BCMLRH7
X-Gm-Gg: AfdE7cnMa4e3kcC7NPJNSnJuVrzkETTZ1JXGZKiQM2KZpI36bgT/tmrUzKUVVZ5lXuB
	nm83vJf8qgzMTfD+Pv7bAg2WLh1a2G2KYhR7clWb7ArIJ3rDRC67Ovpu/4vKkZlZ7Ata3sLZ9sb
	GtLd36T/g0Ou6HWbgY53gjQOXH4tEdY1dkYXIN0OG6i/uXqgOtQe0TzJ9ycwgdJAx6tsRqIWSQu
	4fX118tDP9Lgzo+mXi/faySrxJi0EsztNRcb8ATiXPpD9GTWu57R5PhvSLoHieTOMzB3o1GOb34
	+PQXYB+qYrYrBckaCiB2Qa/bWkXWzMdTlqg/fcghbSAcwRpQFEfZ+gJlT7kBx9Akxohs9EMztcV
	1raE6P/q/NMDTKv74OhZmg5ZSDJx6WY7AjZXDspTfBUgxmTEb99qhFQq/iH59wentpQ==
X-Received: by 2002:a05:7300:1898:b0:30c:ab4d:3826 with SMTP id 5a478bee46e88-30ee150fb37mr4156685eec.40.1782854802639;
        Tue, 30 Jun 2026 14:26:42 -0700 (PDT)
X-Received: by 2002:a05:7300:1898:b0:30c:ab4d:3826 with SMTP id 5a478bee46e88-30ee150fb37mr4156655eec.40.1782854802146;
        Tue, 30 Jun 2026 14:26:42 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee300b286sm11604046eec.12.2026.06.30.14.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:26:37 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Sushant Butta <sushant.butta@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260609064856.547032-1-sushant.butta@oss.qualcomm.com>
References: <20260609064856.547032-1-sushant.butta@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: correct monitor-mode RX
 metadata handling
Message-Id: <178285479779.1590147.10839171330562309613.b4-ty@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:26:37 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a443493 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=k0c8v7JCAQ1gsNTydDoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: upuphzC6BzZZ4I1FcCiUO7Q7QSfkQNJh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfX/SSSB5HGG+Oh
 obJvBC02bK9xFdjVoFqPtOYoTexpXK5/E7bwieMh9gMdxkLlKkBNQ7/a+EWvbQfAvsfpADTq3Xy
 Ch0/9Ze6CEGYskGq+nNACFycFOPWcaU=
X-Proofpoint-GUID: upuphzC6BzZZ4I1FcCiUO7Q7QSfkQNJh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfX1ZOlsvzAGF/y
 o4sU4ZJ4hyrufyWP5UioN1+B4i0QCGptJn1e693YmuGT99QjH2KU0nKtMZlCrXSxZLB4Tb8gIAP
 ApFN7c4mGYJC38xzZs8y/RNiqTEpGUfOPWmvgXtdAnePsH8nnaeUtnsq3CwEE5VEq862KZkU3Y3
 5OhdNbvvuY8jiVHkCz7yPeHd4tvhl1PQAbsB9PX3VfDFK4yvUwrYxTRBU71ZzHs5EcENyBtUnFn
 d5Jr61WQxM8qxSrxNRw6U78ZYSoZxN/gKH6U4m1J0h7i+vIZ0bD3pWLrVI9I8UoyJn1lryy9NUv
 hFCunFEdCEZbcRml+39ifxeLDtsIiDLwx6KT+0tIaDNzo8jvtrkqyVkVOfsA9ZWQetxPyPLE0RZ
 PuQmQeK9caWrXKcxJGO/gZHT1gqSOy7Pakeh1cbK6WhSPcxd87z+0QlBB97G4kRLwfINdWtWea9
 3PXi1aPGLcHavaWf8ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_142644_331136_5C7640EF 
X-CRM114-Status: UNSURE (   8.47  )
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


On Tue, 09 Jun 2026 12:18:54 +0530, Sushant Butta wrote:
> This series fixes monitor-mode meta data handling in ath12k and trims dead code:
> 
> Monitor mode delivers raw 802.11 frames should not set RX_FLAG_8023 flag,
> and populate peer/link metadata in ieee80211_rx_status for monitor MSDUs.
> 
> Sushant Butta (2):
>   wifi: ath12k: Skip setting RX_FLAG_8023 for Ethernet-II (DIX) frames
>     in monitor mode
>   wifi: ath12k: Skip peer link info update in rx_status for monitor
>     MSDUs
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: Skip setting RX_FLAG_8023 for Ethernet-II (DIX) frames in monitor mode
      commit: 5a2b5d6a5a4a19b86d1c0698a3eb3d21f0b06401
[2/2] wifi: ath12k: Skip peer link info update in rx_status for monitor MSDUs
      commit: 56f8f12c1a3c5312de0d7312b229d7bca03dbb81

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


