Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC51C88E75
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 02:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VjazF2u6aHcCpAoZDETq19dN3ZnMJLylSSJylHYqTeM=; b=RcEEQvKlyDq8QQkfwA6/hNIjlu
	QwU3PSWBFRnmRoynr4XBYFbHLh+mv6ACy7+jigsm5qImRjjy0yVOIfALbxeRkN0Ti5ra8Xpz18h+1
	VEsIQX60SEg1fxhSe6x+KooF6gxIevShS8zrXJs/ww73ufDJ2dMTOQd2ed9C53Vnfj9yhr6Dp/kEB
	B0GDzh/5pDaxuQanzwOcKKR4jkr8ue1fYgxfE8f2SJJ964xKHse/a3x8l4YtfuEHhr0nohCEsPtde
	vVDqyqb3tQ3VASwOqSkyoVTyAjcGELZDqFzb0EttQ0oDi/PirFN7/mWsEdYAuCgmuSgryUhDKOpmS
	+RQIqUQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ITB-00000004zsJ-3hz7;
	Tue, 15 Sep 2026 02:00:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6IT8-00000004zrW-1JNi
	for ath12k@lists.infradead.org;
	Tue, 15 Sep 2026 02:00:23 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EMxsNU688260
	for <ath12k@lists.infradead.org>; Tue, 15 Sep 2026 02:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VjazF2u6aHcCpAoZDETq19
	dN3ZnMJLylSSJylHYqTeM=; b=f9ZU9bs3a5oUo9/qWaxRlLegWqegOsM98sGUek
	YpLAWywyhrft9sL+JNzBCdIcH7my5zgqWiHDWHw5ORQw1HtThXOt3iD+7Wk7Y/g7
	0f2jc0gLjIhqyZSeqFd0msrzlLQOV6g8UsIjK7G6tTi4jTGcaA+oecjGswvhC5iu
	lNzIJHC9FphsGcVU8e+Zv3e26yCywEd5Vfn+1q23f+mxD6UNXIyUUNbjnSHz3n3D
	5rfhOdsmjcSyypY2XifwcNYLwAM67wGf9YIL87zbWue9GNZKEZj54xxHXM1BjO6r
	1Uih7DDRLXLqmGOWO9aCnCMJDhGmmQqWLatN1zl40sFzxORw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpergbdnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 15 Sep 2026 02:00:21 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4566537e644so5986805fac.0
        for <ath12k@lists.infradead.org>; Mon, 14 Sep 2026 19:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789437620; x=1790042420; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VjazF2u6aHcCpAoZDETq19dN3ZnMJLylSSJylHYqTeM=;
        b=HsKl/XeXsuzARhbFYKikTmADLhufmDmu2RsIHKjUyMTh1+9QM3lK0GFHkjJVU3dfR4
         lcbqeP6k1HijQiekdzGayhGvPSu2egN8eehZ4Z+332m+NeqNGC7iyY1XgDy8CAmnRbY1
         74Pd1JwtdP4LsiJZB4PoVREJswyxP4PncSA+1CrxNkkp6uHA0KcdwbThQOljFcEbZWEc
         P311Tb1jQc+XB5PWokqa5zYeSiywL7xxVyhOD4jVCnXD8aRwwIv3ZEoOcFinjPAFG8Mo
         yE/ZAJ2fEVCW53LnPD9BYGOphQpehBXgEcpnkOceyZ/rnI6yFR3q1bsaiIK9ALhHkBx/
         9U2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437620; x=1790042420;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjazF2u6aHcCpAoZDETq19dN3ZnMJLylSSJylHYqTeM=;
        b=BH/tp7nSa7tVUB51I4xXD4VlN5uflKOKI1fueLxMQHuD8fgMORa5q9cKrW+tC0a7BC
         ApGKorQPv557s9Uv1RW7H/FIk1JCJdFsf3XSEIN9PEsKJ8U5TIA85icIiwccfvBSDxng
         dzzct+ys88z/e2XGXOwSeWDnqxE2plICCWZaH24V8BB78ayNlCl4Pu6ENOCJ3DhYiG/y
         ihbV7o8dWmwcGPav05LJPwgeGVIOR/VHOQj8yCccpBzxZAhX1dVn6VBHCukYqdufOsEp
         k5sw3x+LDmEp7tMnLJPu8TPGFOw1BdgjYNdj9kA384xd7eMahBJUKKi1tS9wpVrXK5Mq
         S9CA==
X-Forwarded-Encrypted: i=1; AKwUvBwnzRWdXgyoXc3cXnlqSQDftMCi3rrVWszo/AMmVb+MfvN+Gtxd0Zcioc0yH4zEQpcDDhofuzQ=@lists.infradead.org
X-Gm-Message-State: AFuF++ltT6APw7w+z5K7ek5SxiMJrQH4K7nXQj853TLWybLn8hkGXNNT
	/RjKp9Yd5Gj02a+Bd6iSiTbWq+4gpVVn8r/hMQ8c8hJkdoZ/txHw/Hf4dh5DKkojgOrWnH5KTMI
	Cc6kCMb0H+5io+RhUC0ZPpOQw6tG/uBogLCW9WxoeIa423aoHn7b7fmXfpbUY4yif
X-Gm-Gg: AYBFou1MC3TD6E2esU+IDBhY5hXndLtgF2wHgAkFwU4MXcxyoEgFLgaIQqyeARUbMrl
	wyFrXl0DBgaca7gs82W9aAxXzWlKdx8kx67VudaJornip/kr15nLGiBfFZq8op5o/nhLpZdOmJq
	P3SRioYAAOi7zX3OZ0CYcDeGBj1RbrXV3dUV0XdF5SI2A9HfFXII8YA1Wqo7HUgzwNCIR4AsreO
	dtf485DY8wZVVCbob5deqcFsCTTgQHeR9R2DBrxaXEgPLygzlq8XRCNLB22hee83yhSzxN4dDK6
	KCBuyw4BQsn0BT15lKNT0g52/OhVnBrWERmNTU1zyYMLgYaBaREKKNDS/eY4SqShY6cdvbNtM6+
	O5LGHarUzlKH28LL24hCtHkBLVSFUTFzQxs82
X-Received: by 2002:a05:6820:220a:b0:6c1:6bdc:466c with SMTP id 006d021491bc7-6c5404802demr3020706eaf.20.1789437620401;
        Mon, 14 Sep 2026 19:00:20 -0700 (PDT)
X-Received: by 2002:a05:6820:220a:b0:6c1:6bdc:466c with SMTP id 006d021491bc7-6c5404802demr3020679eaf.20.1789437619876;
        Mon, 14 Sep 2026 19:00:19 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143659a9a06sm28347650c88.0.2026.09.14.19.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 19:00:19 -0700 (PDT)
Message-ID: <22125816-3a33-4df6-9dc5-e45f3c970e1c@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 19:00:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260914
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa8a6b5 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=hu0l-D-OjZVreMFwxdgA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: GcYuIMOfFEEkiOzWv72NZAvzVBq7Gx9S
X-Proofpoint-ORIG-GUID: GcYuIMOfFEEkiOzWv72NZAvzVBq7Gx9S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAyNSBTYWx0ZWRfXy+Z864whNGbz
 STpNFKRu4fg5ZCm4qnQqL6fpddX32ZcJofAoTaGHqGREIXWU7xuzjjIE5CQTLEuyKhVYBB1ok6x
 pYr+dcfG+YHfUo4dXeatY0zUwUgAQwg5rgLIHaaQqZ2+bmS+vNGYofyq0qL56xsOdDUGl7IXU+4
 LdDLgWT2+nontzfjiX2R7FCYnaegxhB7aXvvg0Hr8igyqf0BRBHa8/37HVnhM9OTqOy1b7SonNr
 LB06TXBujo4NZGTZU2j4PiO7YXdguaoTepOmg/1/owjYL51sbKceMkyGCBNcx1KBfVBcXiw4CUE
 0UNdJaKT/Gk+IghJDc8V8HGKYk0USDX5meLcpbTHG3oVN86GmKmNZHRaMEUvl4l+NV6Sfxqh0rG
 QTvVXOnk0AXTx1yGabPHBWG8XYC92bFEdOwlnr0ifarBCPeLGIObLqJYRM8E2oe9T/ngyq7ofG7
 vuA9mLE7cPrwGSttsqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAyNSBTYWx0ZWRfX8R8MNuJKqIvi
 aCUoIlcudU7lxg0hCRDcfiPfOfw1RixZVTiym7hrBkTVwHHf7H+MZvn+6JR3QmdVCbvuD6HTPT/
 fOwZkYit+CVcEDjQkGwj5YTxcV3mZZE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_190022_353908_6F8D2481 
X-CRM114-Status: UNSURE (   7.73  )
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

The following changes since commit 50d3d79dc0743b616afb00d01a626c76758721f7:

  wifi: mac80211: set up the TX info early to fix failure paths (2026-09-09 14:51:31 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260914

for you to fetch changes up to 820b8cff81c796ba20573e04722ab62500713f97:

  wifi: ath11k: cleanup arsta in ath11k_mac_peer_cleanup_all() (2026-09-14 11:43:31 -0700)

----------------------------------------------------------------
ath.git update for v7.3-rc4

In ath12k: revert an undocumented and unapproved DT ABI that was added
during the v7.3 merge window.

In wcn36xx and ath11k: fix preexisting object lifetime issues.

----------------------------------------------------------------
Fan Wu (1):
      wifi: wcn36xx: Fix potential use-after-free in TX ack timer teardown

Krzysztof Kozlowski (1):
      wifi: ath12k: ahb: Revert undocumented ABI and dead code

Nicolas Escande (1):
      wifi: ath11k: cleanup arsta in ath11k_mac_peer_cleanup_all()

 drivers/net/wireless/ath/ath11k/mac.c       | 25 ++++++++++----
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c | 51 +----------------------------
 drivers/net/wireless/ath/wcn36xx/dxe.c      |  2 +-
 3 files changed, 20 insertions(+), 58 deletions(-)

