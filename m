Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D880DCD5BB1
	for <ath12k@archiver.kernel.org>; Fri, 22 May 2026 20:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mgJ5edVM+mqGwYghHMz4APWCN08GCaqEMyrnNrUOWY=; b=YubxR9LnD8T8aDH9Yj6dCU0GFs
	iY88VcfITBUb6Mn1fC/HMH0pFAuNK0eefRchjEQugwzODVhoZbPvYBGPIFcWPapRUEyWMF6vnuljG
	uJuEqfX9PNRGyElreCBSoSemPPQfkv/y+YAz1brZ0ab0KRPRJa1L6+n+iXXTqN4w+/m+zSUdSPVVT
	fo1iXdQ8E0/wXUxpuoqnoWHz5k9UbdxaRj4iU4ePlfOBuDB8bkDexJ4qYFXewDQnmtwsJwHEtJR6/
	4vq2OYtTbzAm/u7/MEmUC3ttMW73MIwRhDNTuiBp0kwThKwK65PF+BJPx6WM+aEXMBVZQOM6DZ1Nh
	K/2EptHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQWBR-0000000BqNv-0z0f;
	Fri, 22 May 2026 20:09:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQWBO-0000000BqMo-3eLt
	for ath12k@lists.infradead.org;
	Fri, 22 May 2026 20:09:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MG2xlk3005110
	for <ath12k@lists.infradead.org>; Fri, 22 May 2026 20:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4mgJ5edVM+mqGwYghHMz4APWCN08GCaqEMyrnNrUOWY=; b=EbgztTsE1C9CerSE
	ANTpW3uvn5Il5z/EcdPUowP+j1DovIhpYLkshTBQcFSp04zrMrdGzt9VrEDdhC4u
	/OS8jPtLzIIC64gNN8r1/jWRO1QKY7ePcVrH1lXNsJdefWwgMAsp1OkdSnzgxz2A
	RmeUVsDokIDB0hnA0AhEfhHrMWZiz+A/5xNfbXHXQ2JjFfmAuTexFDG4uSh9GBE4
	Uj7Hhq2m1Z1Dkp6h7E7qH5ORpxVxb0PHRo1f9A+gQd3r8tvMFo7+/vT88LSzxMd0
	CYtP3evhGCD5OxWn9UeuQY1sqK6HwmFMAEMNY2/FH5RrzV0e0fIlG8WG6aFtaO5Z
	vTsYIQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrtbrm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 22 May 2026 20:09:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-910b2b92741so1457358585a.0
        for <ath12k@lists.infradead.org>; Fri, 22 May 2026 13:09:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779480560; cv=none;
        d=google.com; s=arc-20240605;
        b=bw7YwzIylwafMfpmVjSuXq6tySuGCYD187aA6jPZo04jWMZ5kd8Tkoc8f9cOIXCvxt
         YpC0NSwdG7gYFxIYRnv4F/SFmZV0yltaUgTObmVRXw0OiIBb8aemL/0Cj0KvcFSRbDpR
         u3PqxZmACnaIMGJCB5PbC/7s0GL0l2i2ZZePc4R0cVALH+ycv05FrMIpKrtKrShxUP0x
         Ak88QE6aAkBs88XYkJcs9xH7r5bfPXNuKB0l8K5h+UuuLEuji9bTZM27ewAJJWrPlD29
         G9ZVDmVtS/ttpnX1XgYWXBwmXnTzsm2ywvYSt7hGCGVCkRkJ1hM8qilPo3vh5c/vlDtJ
         MLMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4mgJ5edVM+mqGwYghHMz4APWCN08GCaqEMyrnNrUOWY=;
        fh=B482f1YM2NgvHW4qzETy8iLlOoIqfdsjgUC4RKX3mfI=;
        b=KDnwEdt3IMRzSPtb9lBSKY8kXuSXncVogU8KDurTYxtqVqpFEAkr5/n7ZWpTlgjciu
         wKn2d26qRKFh98A9XCWpWs9lbxz/WvAfHyOloAyJpsmgDvKAyENZyJurHXk31ZyVm0n1
         aQB9vUCyZuKAGqwJtkgKcUgEg8VCnTaGz/lKo9xzRRK7ru/kOPrN6eXw1sT/gebUKd8W
         bTZgTnTZsh3isptaHDvE1odryZhXegkk3ehBl+hXpYClVIUJ96xECnnVouNtwk3/Uaqx
         pOPZVSnCMJPw+oXECibpixa2kCZqIsfDvLola3kDckihyx7BD5H6PUUg4J3pC1zAeTfN
         7xkw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779480560; x=1780085360; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mgJ5edVM+mqGwYghHMz4APWCN08GCaqEMyrnNrUOWY=;
        b=BeG5Rli90S9FvFLxRQdbCuFS26vGYpKXdPW0190Xx9y0fEr2fHKVmwXHXxmj5EpTDN
         FKMgIIZYhjEx5I/G5eH5tydDkl2o5iFBq3lXkpMVMwi4uUL5Rnyblvc8ohdPlI8TVwIR
         PXDWOcWYgTAVibxbtzPXZvGYWvfdbK4uQConBlKGXlcxGYYUEVjIUlRu49dalgChU/HO
         kwSUWBJyK76NIa7a3E8VeoPOY+oKiF25+8AfDBKzvtXqueO5Qur5kR3jUwRLUso2VnX6
         CB8mpTAbyjo1RFNHL9wvGrv6qpuWl+tSSiATwbmsRiFkV8Qo+I/aZy0pnitemWt7ps7D
         nXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779480560; x=1780085360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4mgJ5edVM+mqGwYghHMz4APWCN08GCaqEMyrnNrUOWY=;
        b=JWzNmcEcaGiq+L2LGARTtTmPc8kczZmV4kG3xifhFNZ42iuO1O460mNmLnrXpZKbZb
         DglYmNzzo0IrfZUXM1ZMbcK3KYUNLGg/jvrTh4KwBzEMi2ltJRu9LLVCl7SMg+ogDgWS
         VRN8doVn2yzCsDMYMxCrJI57Ah9lu5TGooJIaPc4maCBVsk8LOUREp7TNZiY9feby3hT
         F3E3E5h/5An+Nfz4OGskDt6WflOnXLhJZB8jOmRRx7saCEX/HQr19tpZGE6O9pKvAc9n
         18rDqRK5LqT1wUw6qIEBaxokY37UN/zM1uIEu+iAmcaX7wGYAd/04Z7fWRp8mcNVY0Cj
         7odA==
X-Forwarded-Encrypted: i=1; AFNElJ83d3c7Zxp4oB0qJQUWGJoY3RPoq7AO1F4wYfR0ZCll/Xn129g4Z9IqF6qPZmKdNODOlBww7cI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/WdKg+EMzysCoxEk5zywtJYPnK73jitok48uk97uVPCCiekum
	ftz7CAFXz+jf30BlL91txw8LfBbf8A7UIUkFTfHZS3GrngQ7wLZxlmYKwaGOEaLKsXcBaww2w0p
	KglDXBPoBlHx7tzLGTuKoJezHgEdBFkgcMTXU46a7mDTyxgNGCFo0ZX/LFlsiEbQLxGN6PzGw3w
	RJTB6fCJKDOj78vguXnoEDMZiVMw7hqKTTl/9ivX4=
X-Gm-Gg: Acq92OFNaLGrU0sa/rqZyEs+AKqx3hy5TPuwb5fXQf+LXNDsqo6aePYZ1NX4R8TWPvZ
	6rwDPNdzzogXEN3IWG0a3NLDUkb9qkKOeLB9JQ6AmiBMEDaba9q5cOjS9e2Dert+DxEkXrCyRd+
	hKp6DfugCUxqCj8X9bSr7MVV2QyTnC0Fk5cDmFudw7hgu4bbdyxJdWCxafaxoiBRLiGtkebDO7i
	tzIWkRv7HvS3bVbiSfnhDm5zycdraD2WBkJklHKp4kpwvljxYpiZGcpYCrZTgrpeRwN
X-Received: by 2002:a05:620a:28c7:b0:8cd:aa61:ad8f with SMTP id af79cd13be357-914b50cab94mr617029685a.14.1779480560227;
        Fri, 22 May 2026 13:09:20 -0700 (PDT)
X-Received: by 2002:a05:620a:28c7:b0:8cd:aa61:ad8f with SMTP id
 af79cd13be357-914b50cab94mr617022585a.14.1779480559708; Fri, 22 May 2026
 13:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com> <20260522-mhi_runtimepm-v2-3-fbebf41a82bb@oss.qualcomm.com>
In-Reply-To: <20260522-mhi_runtimepm-v2-3-fbebf41a82bb@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 22 May 2026 22:09:08 +0200
X-Gm-Features: AVHnY4J-9F8AAJuD_tJW6-iaDPIYDcwXI9s5goDnYZwmGPWaSdjsV19cBJfwNa0
Message-ID: <CAFEp6-1sdQn11NKom6cfwtJvZX-CnPRpJeVzQ+99Sb4A4L-qaQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] net: mhi_net: Hold runtime PM during active data
 path operations
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        netdev@vger.kernel.org, mayank.rana@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, vivek.pernamitta@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a10b7f1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=omgbQWz8Cy1bZfrwG_oA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDIwMCBTYWx0ZWRfX+qpKYcpZHl1z
 A8dtZScwKlqO2l6NaAMg7BpMfJHBUmobhesJp1apgCQcMyiGomrNlvBJm4J/dW6sB/pLtj9334A
 bjEUr7UZ4CTxkfg82wdr/6oUyeWY0WnpOe8WBQkV6aa2QDqjmFPH0YKkhLFlTIgxqZG5jUzWfdS
 s6OmyE5vBYDX1ES9+kGyaQvSYkPXBlcc9bvQBUOo8290yPxhPE4zY6TqVGrOzx+j8tWkhjSpjtA
 T0KtoZLMMd8vs8OtETk8Jtm0ZS7GGLKmYac56wvQWH9eOsesxRUBD55UNJJ7iOgBNT1cHEe0mi3
 50jJde/3XWI1bxNh047L/anXG4JMkkiZsRyxd9fruAI5zb4IjDDJXmSUdlElpRzG+FOxDdJZ521
 5P1+ju6gAgXAGoH3dmx/eTlG5Lea3sVqESEdYxN1QDfMovBLWNvUUcKB0zoHHfYCVDrnPDdMWbr
 Jq6NsSnPEoZedlEQFMA==
X-Proofpoint-GUID: 9OTInoIfCosKoaKdYj4GpBVdTgO4wpzQ
X-Proofpoint-ORIG-GUID: 9OTInoIfCosKoaKdYj4GpBVdTgO4wpzQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1011 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_130922_919090_8E59DBD0 
X-CRM114-Status: GOOD (  26.98  )
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

Hi Krishna,

On Fri, May 22, 2026 at 12:01=E2=80=AFPM Krishna Chaitanya Chundru
<krishna.chundru@oss.qualcomm.com> wrote:
>
> The mhi_net driver does not coordinate with runtime PM, which allows the
> underlying MHI controller to be runtime-suspended while transmit, receive=
,
> or RX buffer refill operations are in progress. This can lead to stalled
> transfers or failed queueing once runtime PM is enabled in the MHI core.
>
> Add runtime PM reference counting to the mhi_net data path to keep the
> controller active for the duration of TX, RX, and buffer management
> operations. Enable runtime PM during probe and take/release references
> explicitly around these critical paths.
>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.co=
m>
> ---
>  drivers/net/mhi_net.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
> index ae169929a9d8..5d7f9ccdb17b 100644
> --- a/drivers/net/mhi_net.c
> +++ b/drivers/net/mhi_net.c
> @@ -9,6 +9,7 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/netdevice.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/skbuff.h>
>  #include <linux/u64_stats_sync.h>
>
> @@ -76,11 +77,19 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, =
struct net_device *ndev)
>         struct mhi_device *mdev =3D mhi_netdev->mdev;
>         int err;
>
> +       err =3D pm_runtime_get(&mdev->dev);
> +       if (err < 0 && err !=3D -EINPROGRESS) {
> +               dev_err(&mdev->dev, "pm_runtime_get failed %d\n", err);
> +               pm_runtime_put_noidle(&mdev->dev);
> +               goto exit_drop;
> +       }
> +

I am wondering what the value is in pushing this PM responsibility to
each individual MHI client driver and requiring every MHI operation to
be bracketed with runtime PM handling.

What does the client driver know here that the MHI core itself cannot
handle centrally? It feels like ensuring the controller is
runtime-active during transfer could be handled generically in the
framework instead of duplicating the same logic in every client.

>         err =3D mhi_queue_skb(mdev, DMA_TO_DEVICE, skb, skb->len, MHI_EOT=
);
>         if (unlikely(err)) {
>                 net_err_ratelimited("%s: Failed to queue TX buf (%d)\n",
>                                     ndev->name, err);
>                 dev_kfree_skb_any(skb);
> +               pm_runtime_put(&mdev->dev);
>                 goto exit_drop;
>         }
>
> @@ -251,6 +260,7 @@ static void mhi_net_ul_callback(struct mhi_device *mh=
i_dev,
>                 /* MHI layer stopping/resetting the UL channel */
>                 if (mhi_res->transaction_status =3D=3D -ENOTCONN) {
>                         u64_stats_update_end(&mhi_netdev->stats.tx_syncp)=
;
> +                       pm_runtime_put(&mdev->dev);
>                         return;
>                 }
>
> @@ -261,6 +271,7 @@ static void mhi_net_ul_callback(struct mhi_device *mh=
i_dev,
>         }
>         u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
>
> +       pm_runtime_put(&mdev->dev);
>         if (netif_queue_stopped(ndev) && !mhi_queue_is_full(mdev, DMA_TO_=
DEVICE))
>                 netif_wake_queue(ndev);
>  }
> @@ -277,6 +288,12 @@ static void mhi_net_rx_refill_work(struct work_struc=
t *work)
>
>         size =3D mhi_netdev->mru ? mhi_netdev->mru : READ_ONCE(ndev->mtu)=
;
>
> +       err =3D pm_runtime_resume_and_get(&mdev->dev);
> +       if (err) {
> +               dev_err(&mdev->dev, "pm_runtime_resume_and_get failed %d\=
n", err);
> +               return;
> +       }
> +
>         while (!mhi_queue_is_full(mdev, DMA_FROM_DEVICE)) {
>                 skb =3D netdev_alloc_skb(ndev, size);
>                 if (unlikely(!skb))
> @@ -296,6 +313,7 @@ static void mhi_net_rx_refill_work(struct work_struct=
 *work)
>                 cond_resched();
>         }
>
> +       pm_runtime_put(&mdev->dev);
>         /* If we're still starved of rx buffers, reschedule later */
>         if (mhi_get_free_desc_count(mdev, DMA_FROM_DEVICE) =3D=3D mhi_net=
dev->rx_queue_sz)
>                 schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
> @@ -362,20 +380,41 @@ static int mhi_net_probe(struct mhi_device *mhi_dev=
,
>
>         SET_NETDEV_DEV(ndev, &mhi_dev->dev);
>
> +       pm_runtime_no_callbacks(&mhi_dev->dev);
> +       err =3D devm_pm_runtime_set_active_enabled(&mhi_dev->dev);
> +       if (err)
> +               return err;
> +
> +       err =3D pm_runtime_resume_and_get(&mhi_dev->dev);
> +       if (err) {
> +               dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed =
%d\n", err);
> +               return err;
> +       }
> +
>         err =3D mhi_net_newlink(mhi_dev, ndev);
>         if (err) {
>                 free_netdev(ndev);
> +               pm_runtime_put(&mhi_dev->dev);
>                 return err;
>         }
>
> +       pm_runtime_put(&mhi_dev->dev);
>         return 0;
>  }
>
>  static void mhi_net_remove(struct mhi_device *mhi_dev)
>  {
>         struct mhi_net_dev *mhi_netdev =3D dev_get_drvdata(&mhi_dev->dev)=
;
> +       int err;
> +
> +       err =3D pm_runtime_resume_and_get(&mhi_dev->dev);
> +       if (err)
> +               dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed =
%d\n", err);
>
>         mhi_net_dellink(mhi_dev, mhi_netdev->ndev);
> +
> +       if (!err)
> +               pm_runtime_put(&mhi_dev->dev);
>  }
>
>  static const struct mhi_device_info mhi_hwip0 =3D {
>
> --
> 2.34.1
>

