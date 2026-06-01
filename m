Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FBBCD5BD1
	for <ath12k@archiver.kernel.org>; Mon,  1 Jun 2026 06:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qvyog2xv0x9HgcgrlPWRyztS6BlXbzPPs8Gk8UNZeaQ=; b=MqLb/Az4G/KkYIiNG6r9NDuFWS
	NACyS6w7Ouw1HR8qMKKywk3wnAKaMJzWL6gIPXHoWZYcyag0V0O0v++S7ayBh1m/eXZNTnZpc/9IM
	dTCP7W3nONEF6ayRSTW1d4MvUqjAZKmWWKiFlSQwHOuU/RBJ96YbuMM+C+rF1dXm3wyTLl9UKvfQc
	k3tSUYIP8i7BKvquUKYYwFCbwlrTcsajYcHOJa9jgpjzkxLg9ac22vR/GIcK5uHnPBudIxEyUu34C
	zf52BvflG/XDNnim+XA4pIOuAYaQN1t7/SbWv2Zq3DNJQK3TeVrIPgM1A1uay/MJ6PtqgRerorXc2
	v6uk7ZAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTvyo-0000000ABoA-1kpD;
	Mon, 01 Jun 2026 06:18:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTvyl-0000000ABnp-3s65
	for ath12k@lists.infradead.org;
	Mon, 01 Jun 2026 06:18:29 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VMo2iQ4162414
	for <ath12k@lists.infradead.org>; Mon, 1 Jun 2026 06:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qvyog2xv0x9HgcgrlPWRyztS6BlXbzPPs8Gk8UNZeaQ=; b=BkWyl2ZITRH6LyOA
	IL5o8zucdGlBako0aKAnKPy08Eknm+bFBSBETkNCrxS4S1UzxX8zrX0xLdbfSLR6
	Y87On6OwWxr4ubyWhmuKmHJBm/ntWMuwk43UDL5Lvy1Qdec9bqdawy5X6h4fS3lG
	ZCea9h7BUAPLzHe4LFEAswS87+vpZ/q79D67aqSfQAlaQbMBeaYvtDpxT/BZFI1F
	CLJCKnNrHmr3VwiGjoQACYfdFKw52SMM7kCt72CDJAt1+qON6S1TjbDuY4gKJybl
	pkD5hxXyuL0gfPFxMeiR7NluqW84UT4Zwkvpex5cox+B/2nnyLtJkJO2AAyJW437
	ze5gdw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efux55jqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 06:18:26 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-135d1492f13so870240c88.1
        for <ath12k@lists.infradead.org>; Sun, 31 May 2026 23:18:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780294706; cv=none;
        d=google.com; s=arc-20240605;
        b=GIT1Jb5bPfk4tiz7r4LZ10185Vjop8RxxUYf0X9kqcrxVE11eEZ/hoFelKRdNOLcMS
         wCuNu/Jzf97PZWiuTt1fpeik1ThkntdbqExx4Pz9qlWpI3vJEX5h+OeZaEPAoHzUmS+O
         gkFzPAAve5iz2+9rmgDgo20PufQByLgfWVZ9RDELsCwraYoPAD84kos13IwmWYVGuaXJ
         lsyvTEMe2X0R7GyeTcXWW1+/aqZ6oo9Uv/+r6eS+PUmACfP+jbjnOLoYPlD1qPbkE8wH
         CqhXktol7Gcb0H7ZCCsqrijzsCEN5jYVw6sscMU6zcF+ltknHyJYhJfZYFSOkPYTopzW
         urYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qvyog2xv0x9HgcgrlPWRyztS6BlXbzPPs8Gk8UNZeaQ=;
        fh=VV/I1P1bbhMazKXflHy721NzaweK7XYFiBP03G8pthM=;
        b=D2ObBcGPjjJH2s9EOn6T9vbjrGmdVnM/aKsdLQPTAbWU1gkbKl/xntXSJByUx94bQ9
         uWbrIT7u06+q7JGsYnxXaRPS2nGIqzhclE4BCgUC9LiuoJ7KwtEg/WG6Magsm3e77uUk
         si7uVpJd3cndsSkYkmGl0YCMzYtovsDXJrdSCWHMlo89SZCFKXUIuBFeGNkqEl1RdnFe
         YELL2gk3xlX2bnBd6F9VhYev4UwSTYWko7coKEns3eaI6SMMr1zM/l5COgaYLiImAFgg
         hI4OR9yu+YmDAinwc8ji5jBOG6wz3ga5wH3u3Jas9ab/bKieyz1U5StHrek/8U913oPr
         Lqtg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780294706; x=1780899506; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qvyog2xv0x9HgcgrlPWRyztS6BlXbzPPs8Gk8UNZeaQ=;
        b=T/kNHEOIVF2s8+unURl4f2YQb08qzo1FoaAA4aHAZvtcVgPZrJTWYNKdI85p5H9s4y
         GcALys4sSaNA1Ha9DT0/BzJEQGzdv+Ry4W81qv/1dy9LpTS8xn3vdtsfddCIwXuV18GO
         IqGSXi6UhDFeWvMXhbBjdbhH1vzGzu8LhYfHGmcqZlsMSBVU7sfqpl1eVCVmvd1+szwB
         Z9lQ9Kov+ImwQDdH0pc+JSc7nybMX9/FyBRB6Z3q/JuOz1JvYAjNlnwgfz76q0vgwi1h
         MGUafs9iEQ1Q+uR4A9edL7joprDIVFH2bub9wM+byyMSjS3cf+CJ8H2rYOxcr3eU8BEb
         ooAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780294706; x=1780899506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qvyog2xv0x9HgcgrlPWRyztS6BlXbzPPs8Gk8UNZeaQ=;
        b=PqjGcHKgvkLlw9Q4sUzPAxeqKRZzTiCeBDxnxzTeysSWfXI/xjsJK/GjFiQhz6eT2P
         8JVi5lnzQpoB/LX++6G9awmCiI2RsxqbeYmSLgWDl2eWJFGNpwG8h7qms6u/FneXbffQ
         dY/0WVvYIl1vbZ26I4QnRISXM5uAjI3r3i73CLaIM3CBqQlJaaKtQjWQ17w7oIWRHwBf
         w1Fw71LF4Cr9hTo6IYViU/edU4gSUa4mjSlktIeRiTnepS0aCffTYUz8zAz50UGK+K5W
         CtSuxGj/p45nBdqCxcX5CMAtndv1nY4U3bAKQq4qmWaqE/vvCybwYo3CR/mNmydJzU/X
         g2JA==
X-Forwarded-Encrypted: i=1; AFNElJ8CRzBxKg7NdnsOVd1r1rtTNDYaFnTbIpypFdhFjn64bo78C1CvJWvVSrs1cPEtH9C19wZtvx8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0qmzCPlX8rl6IHmBQpi/DNBImChOGkZl7lE52YcRMSQbVjCMe
	TjDh01RBzcbpS8kKnr5EB7IcYmqHjHn/MtYRBCT20pN2mqV7WI3mQkwxiMmuvzt1EjMX6Rcv2A5
	WaIoBubJtKYoOBbxnk0hQ4zb0VJRgjEbjhAFIzzshbw4TIf6E36XGatg4uSsvQpdWqjdKNrZKJr
	DtGCX7FCbrtAaFVcGIAjp10osAAe4+NMxTkfLt9UE=
X-Gm-Gg: Acq92OH9hlvPcpwqcnsz22i4Fp/rL//3M6AEYmuYzpd5l1mpXjWbfvPP39TA2dmoUd4
	smB2MV5ndcf4fPPRB+QOJXcNMAE//43xkV6xfyB5R/Z4WCz3uLDxR18TttQgQe+FXVlsrul/ICJ
	w5Woeg8ZF59MvBQbKUxwxT55aS90EpkfEI9LRbAOmqXrtoAq42otY6EbjSa6IogI+XKehsdT1FC
	RQf92fH7w17t6QiC5u4ojJO2U6l1A3e1YG7DQORDNnuC7kzym4=
X-Received: by 2002:a05:7301:100a:b0:304:e865:f7da with SMTP id 5a478bee46e88-304fa6e6dc3mr1804588eec.7.1780294705804;
        Sun, 31 May 2026 23:18:25 -0700 (PDT)
X-Received: by 2002:a05:7301:100a:b0:304:e865:f7da with SMTP id
 5a478bee46e88-304fa6e6dc3mr1804576eec.7.1780294705272; Sun, 31 May 2026
 23:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260512021108.2031651-1-miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <20260512021108.2031651-1-miaoqing.pan@oss.qualcomm.com>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 11:48:13 +0530
X-Gm-Features: AVHnY4KiU0ErHvWRPfRQiRNS-2Qoq90Pk8G7CKi42DNA3IBzX7PmwvcS2nXeZng
Message-ID: <CABkEBKaMYYVCfFSy7xQ9oN_OCq1mJpqB1ruwO5imePrmwQ8MEA@mail.gmail.com>
Subject: Re: [PATCH ath-current] wifi: ath12k: fix memory leak in ath12k_wifi7_dp_rx_h_verify_tkip_mic()
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: jjohnson@kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: DBjmyQGngIGv4_7PUv4aZEePh26VeIjh
X-Proofpoint-ORIG-GUID: DBjmyQGngIGv4_7PUv4aZEePh26VeIjh
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a1d2432 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=3WkuQKjiOEFfKZUmQP4A:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA2MSBTYWx0ZWRfXxA48aXV25Qd0
 8deeU9NuR7RCjOvc5F+RTz6Vl3WhLyPt+p5p+SQuGHiVkWIMU3fu6pe/tFXORFVmovlZ0XdN16L
 mAAErIEIpwcwvMlI6vFqhmdxIwibgOEjMzKwWqvX7ZEirME21oHoAMovi7VyDxgHrlVFzTfL49r
 uwumVubo6yUReFt5tJYtGHYcUhjFXZohfHBBkUrA6dqZY5qFzgOl7ImbWdsi3+/LbTRqdm04eAm
 ma15ZJLIS8+xhI9RxMnemenQ/m4DD3PxScN5QIVK8sqEYHiyOnDZaltV7XrlbL9p6gDPpuq3kQL
 /lr+dXm8hTf5Bvv1y03mwxMkBnOghcCQWC8K3pzYkMlkmCkCVxk6tkA3xkbd/al0jk/Z6mUxY97
 vvYEMAQR3BBzl5Ok1rKNnT+p2f/pXiW32ED8CuiR/dU8oECYmSR+rinZP/kUzWKRGAgOtu28p0F
 Gkq9e90tycjUwJf5vYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_231827_966506_51AB8169 
X-CRM114-Status: GOOD (  22.84  )
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

On Tue, May 12, 2026 at 7:41=E2=80=AFAM Miaoqing Pan
<miaoqing.pan@oss.qualcomm.com> wrote:
>
> In ath12k_wifi7_dp_rx_h_verify_tkip_mic(), the call to
> ath12k_dp_rx_check_nwifi_hdr_len_valid() may return false when the
> NWIFI header length is invalid, causing the function to abort early with
> -EINVAL.
>
> When this happens, the error propagates to
> ath12k_wifi7_dp_rx_h_defrag(), which clears first_frag by setting it
> to NULL. As a result, the corresponding MSDU is no longer referenced
> by the defragmentation path and is never freed.
>
> This leads to a memory leak for the affected MSDU on this error path.
> Proper cleanup is required to ensure the MSDU is released when header
> validation fails during TKIP MIC verification.
>
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_S=
ILICONZ-1.115823.3
>
> Fixes: 9a0dddfb30f1 ("wifi: ath12k: Fix invalid data access in ath12k_dp_=
rx_h_undecap_nwifi")
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/=
wireless/ath/ath12k/wifi7/dp_rx.c
> index 945680b3ebdf..a5e290edaa89 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
> @@ -1028,8 +1028,10 @@ static int ath12k_wifi7_dp_rx_h_verify_tkip_mic(st=
ruct ath12k_pdev_dp *dp_pdev,
>         skb_pull(msdu, hal_rx_desc_sz);
>
>         if (unlikely(!ath12k_dp_rx_check_nwifi_hdr_len_valid(dp, msdu,
> -                                                            rx_info)))
> +                                                            rx_info))) {
> +               dev_kfree_skb_any(msdu);
>                 return -EINVAL;
> +       }
>
>         ath12k_dp_rx_h_ppdu(dp_pdev, rx_info);
>         ath12k_dp_rx_h_undecap(dp_pdev, msdu, HAL_ENCRYPT_TYPE_TKIP_MIC, =
true,
> --
> 2.34.1
>
>
Reviewed-by: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>

