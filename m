Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B10D66BA2
	for <ath12k@archiver.kernel.org>; Wed, 17 Dec 2025 20:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vthNad2+T2rmsoTcjGmtKVeS6Byiedh7dsoEOYpCIwY=; b=Xco+nwC/4J06Uhdz/K9HL9dWTi
	eRGLlPN3TLAOTwCXJTCuaoDD1lIrBgkQcK8ugZUdceUtEjXylNaUeBL5ROo93d0ElBrkKI1Dwwi5x
	2Aj1fv9ATjupXrIU9q2khQwLxg4Pj7ifpQuN+tH0YMlOY6yMVwOgou9dzBnUGpYcotAxTNgWil07P
	50Ma4vzfwP4rpL7ioK3i5Hd5K0ZEX4oJSU1H9ZMdCiKO96i0TrpoErYccXWf0AJBXbXcBmSXwfBfI
	YDwb9ryYxckVo6Kr6OlZm/e0YhwyXT4g+Jb5WAZcvbFCQyiF9sVw9igW3dJ5nuBVkklOyHVl/RPBJ
	ECp1iL4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVy4Q-00000007Mzf-3GAB;
	Wed, 17 Dec 2025 20:24:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVy4O-00000007Myp-3DGA
	for ath12k@lists.infradead.org;
	Wed, 17 Dec 2025 20:24:26 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHJBbPb3355144
	for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 20:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vthNad2+T2rmsoTcjGmtKVeS6Byiedh7dsoEOYpCIwY=; b=bWjHUkwFx4jFAQay
	c6sPLzRcwwaVi1fRc5Oxny10U/XHwh3YfV/ZDxjy1u7iVOWPRCjV5+g2e+MpVUl/
	GjEE6EsRHhIVuS76uzFBKTuM9C/5wDZ0a8+j+lAgVNE4yps3R4lGDKYftzZ18OnX
	HUD1xYlD1/Us2SkE8VOql/8LMbvAyG1Yc3d+5mMB1KURCi2nkEM9+cXMxY/3tAlO
	zzK7hHa/RDlbkkiGJpOL+tCXT8bhL6VDiaYYuNm12xCvSijcVFgVRRlA0AgbUJ20
	3ENBhDt6aBeNdQ83AirCn6rvu9C2dhP0PCjxwxPnwGL/shNxYDvETsboj23trR8X
	cvGJ9g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40u78gm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 20:24:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a32bf024cso39448506d6.2
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 12:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766003063; x=1766607863; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vthNad2+T2rmsoTcjGmtKVeS6Byiedh7dsoEOYpCIwY=;
        b=B0gx46fJhw+sbIQA46Yfwg6x498n/nhmYWMZVJ+Ob5TzE/KTnHX0mMj2ejiNQh4aCw
         ILctcTm4H5SjtpE+idndUn4/VL299SIABkXrKpyMJOfCqAij81UHAxHZUvyjJFaKxBzq
         F64gbtL5sOecnYH0NGCAyxFu6Uf+L2I5ZurrT5Rwi5JgSmVT/pg6wCa7eEMn1AKKhefZ
         PcIbr58XGDkFSmFjg/HjFaN4hc3Foy7uz140cD/U1rbtjAbzCOA7kt1Bg1U6ao7WbQ32
         ulr+giWZXdIjN2S67m5pnkxXvCEmsZtwb/nLpWLOkCEanLI1xA9UtggqNidQzNGo61Uf
         IDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766003063; x=1766607863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vthNad2+T2rmsoTcjGmtKVeS6Byiedh7dsoEOYpCIwY=;
        b=fqNhsbDVXSziTYMvbzzkamQ8jawAVSacz3GmUV5qPYHA0mV7evAXsZfg/bvZjXxsCO
         h2hZLLGSRh5+fZbL4b5MyCnsDKUKJnN9pB8fHQ3mRpsmtBzy896E/lSqoI7Zfa/Kbq5S
         E8oigy5fjD/iWwr9bQflrsK4t5Oc1g3BZiisCpwmekj9kRrc1dguhc3CmZ4P767ASYV5
         dC8jwJQvYadWbpAKf8Srp3Svkq0i17+56FFLvcuB9lCrvKQ6Us9bUeDssslFz4063M8c
         WcwyXPgZEd4c//pfhfncyJpxGM02IoR2QkoABG6EOXqYkZhwJC3Rb4OQ4Q7+mJpnBuMV
         1/HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmlXgSzOx5NxcATdWCcbs234sIaRfNyD8sqASyFi6igrXapshaiFJl+ZHc+JAbWq/6deWUnHM=@lists.infradead.org
X-Gm-Message-State: AOJu0YySNTX65Tl7tWfqEdWLdeElCqTfV8c86Dk6aDJrg/sp8Xhr4G2N
	eMbEv5rj2o10ErQzga4HWYJVSTDSHH8qzkqhuwf1j/5uzcLxinkUbLUND5MjuTRR3l9ACBuZscI
	3nQrIBUUoEC/OTSn6+H8AiGDfkol5sDd0ZbwQT0d++naIXEg8wUWJkQcKNQQIDO9gU6RLodPxaa
	ukS2zi/ydbXEWFOOADSduWMSlZOfeySOGA4XpHQTk=
X-Gm-Gg: AY/fxX7r2BB5KTAzXuV8IIQ44I32YWCbfeLLR3Aziz5AQKlbIjNE5fJHLMMa/Sz0MIE
	1rd5ns6eeRjUTr2jX+E2R61hdABkvurFlNiigM054dWb0Nddl77iRR1RyE6ktAvI+CNGmMlirou
	7bSFcxtBEE9MdNtNAaJwRFHiFsH5XbOK7TTZPTHftjn9ayTKxrCNH8eZoSieyHlEZaVYo/hnibL
	Dtowdc0aXwGilcfEcgTLlofCp4=
X-Received: by 2002:a05:6214:2403:b0:88a:27f1:45b4 with SMTP id 6a1803df08f44-88a27f15228mr221016276d6.64.1766003062666;
        Wed, 17 Dec 2025 12:24:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeBgJQN5Ey0wcQ6AWDyHDO/iXdgT8XWK/xdnuSO6/M23MJ44oZy/UWfQN2bu+7isUHsPE6XDH3pL56E5SFUKk=
X-Received: by 2002:a05:6214:2403:b0:88a:27f1:45b4 with SMTP id
 6a1803df08f44-88a27f15228mr221015556d6.64.1766003062064; Wed, 17 Dec 2025
 12:24:22 -0800 (PST)
MIME-Version: 1.0
References: <20251217-qrtr-fix-v1-0-f6142a3ec9d8@oss.qualcomm.com> <20251217-qrtr-fix-v1-2-f6142a3ec9d8@oss.qualcomm.com>
In-Reply-To: <20251217-qrtr-fix-v1-2-f6142a3ec9d8@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 21:24:11 +0100
X-Gm-Features: AQt7F2q7A1e739k8MGr1ULDKzmInip-7FQYO14MzSUzmqXEdlwQRdTjGriKEiYU
Message-ID: <CAFEp6-1hepC9TdkXVPGDB393e661jTfQvvC7hjfKNC5r6x7RZg@mail.gmail.com>
Subject: Re: [PATCH 2/2] bus: mhi: host: Drop the auto_queue support
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maxim Kochetkov <fido_max@inbox.ru>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mhi@lists.linux.dev, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: CTYqBvJij8xxGSWjnv0nJnOUQeb92k0G
X-Authority-Analysis: v=2.4 cv=Z8Th3XRA c=1 sm=1 tr=0 ts=69431177 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=7mQcDxK4x4bWUiN2oWMA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: CTYqBvJij8xxGSWjnv0nJnOUQeb92k0G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDE2MiBTYWx0ZWRfX28VnoXUZm+jA
 RAsI9XaVWw2cfZbrku3kbzy4VITAUg9g1vsG/f5Om7EA+yaalfArZxrurspkrVHkrSPq93fofxk
 cjMlySpqKFH4W0DoKcV854+FsRhm77PWxE/E4c9m2V7BnmskiAmhpUmgegVm9LJ87zAbRgvDGLy
 QJJEl77bL5FrWbEdUB2YWu1CViU+B1CpMDo5OUalp0dvF12QB/q8Bb3AU5zXAyrXePjMKi0eCsX
 h/om+k/BQijIftbdUsVS8S2lYY5UB3PCz8qlHsGiGD0lgVPNVKk59+OEwGnpai6PMwohcSn5g6K
 Fvg3yvCkii79RIAjJASnS5pStzYGMDevNfki0G3n8o8+dgGzK+cUuyWrgoDxzRiuanwbQQ9R7Qs
 7UGu3Gt4dauDiPMSAhur6yYYkH31Ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_122424_831869_F77CB1D9 
X-CRM114-Status: GOOD (  25.77  )
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

On Wed, Dec 17, 2025 at 6:17=E2=80=AFPM Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> Now that the only user of the 'auto_queue' feature, (QRTR) has been
> converted to manage the buffers on its own, drop the code related to it.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  drivers/bus/mhi/host/init.c     | 10 -----
>  drivers/bus/mhi/host/internal.h |  3 --
>  drivers/bus/mhi/host/main.c     | 81 +----------------------------------=
------
>  include/linux/mhi.h             | 14 -------
>  4 files changed, 2 insertions(+), 106 deletions(-)
>
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 099be8dd1900..b020a6489c07 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -841,18 +841,8 @@ static int parse_ch_cfg(struct mhi_controller *mhi_c=
ntrl,
>                 mhi_chan->lpm_notify =3D ch_cfg->lpm_notify;
>                 mhi_chan->offload_ch =3D ch_cfg->offload_channel;
>                 mhi_chan->db_cfg.reset_req =3D ch_cfg->doorbell_mode_swit=
ch;
> -               mhi_chan->pre_alloc =3D ch_cfg->auto_queue;
>                 mhi_chan->wake_capable =3D ch_cfg->wake_capable;
>
> -               /*
> -                * If MHI host allocates buffers, then the channel direct=
ion
> -                * should be DMA_FROM_DEVICE
> -                */
> -               if (mhi_chan->pre_alloc && mhi_chan->dir !=3D DMA_FROM_DE=
VICE) {
> -                       dev_err(dev, "Invalid channel configuration\n");
> -                       goto error_chan_cfg;
> -               }
> -
>                 /*
>                  * Bi-directional and direction less channel must be an
>                  * offload channel
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/inter=
nal.h
> index 7937bb1f742c..7b0ee5e3a12d 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -286,7 +286,6 @@ struct mhi_chan {
>         bool lpm_notify;
>         bool configured;
>         bool offload_ch;
> -       bool pre_alloc;
>         bool wake_capable;
>  };
>
> @@ -389,8 +388,6 @@ int mhi_rddm_prepare(struct mhi_controller *mhi_cntrl=
,
>                       struct image_info *img_info);
>  void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl);
>
> -/* Automatically allocate and queue inbound buffers */
> -#define MHI_CH_INBOUND_ALLOC_BUFS BIT(0)
>  int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
>                        struct mhi_chan *mhi_chan);
>  void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index 861551274319..53c0ffe30070 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -664,23 +664,6 @@ static int parse_xfer_event(struct mhi_controller *m=
hi_cntrl,
>                                 mhi_cntrl->runtime_put(mhi_cntrl);
>                         }
>
> -                       /*
> -                        * Recycle the buffer if buffer is pre-allocated,
> -                        * if there is an error, not much we can do apart
> -                        * from dropping the packet
> -                        */
> -                       if (mhi_chan->pre_alloc) {
> -                               if (mhi_queue_buf(mhi_chan->mhi_dev,
> -                                                 mhi_chan->dir,
> -                                                 buf_info->cb_buf,
> -                                                 buf_info->len, MHI_EOT)=
) {
> -                                       dev_err(dev,
> -                                               "Error recycling buffer f=
or chan:%d\n",
> -                                               mhi_chan->chan);
> -                                       kfree(buf_info->cb_buf);
> -                               }
> -                       }
> -
>                         read_lock_bh(&mhi_chan->lock);
>                 }
>                 break;
> @@ -1177,17 +1160,12 @@ static int mhi_queue(struct mhi_device *mhi_dev, =
struct mhi_buf_info *buf_info,
>  int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction di=
r,
>                   struct sk_buff *skb, size_t len, enum mhi_flags mflags)
>  {
> -       struct mhi_chan *mhi_chan =3D (dir =3D=3D DMA_TO_DEVICE) ? mhi_de=
v->ul_chan :
> -                                                            mhi_dev->dl_=
chan;
>         struct mhi_buf_info buf_info =3D { };
>
>         buf_info.v_addr =3D skb->data;
>         buf_info.cb_buf =3D skb;
>         buf_info.len =3D len;
>
> -       if (unlikely(mhi_chan->pre_alloc))
> -               return -EINVAL;
> -
>         return mhi_queue(mhi_dev, &buf_info, dir, mflags);
>  }
>  EXPORT_SYMBOL_GPL(mhi_queue_skb);
> @@ -1472,45 +1450,6 @@ static int mhi_prepare_channel(struct mhi_controll=
er *mhi_cntrl,
>         if (ret)
>                 goto error_pm_state;
>
> -       if (mhi_chan->dir =3D=3D DMA_FROM_DEVICE)
> -               mhi_chan->pre_alloc =3D !!(flags & MHI_CH_INBOUND_ALLOC_B=
UFS);
> -
> -       /* Pre-allocate buffer for xfer ring */
> -       if (mhi_chan->pre_alloc) {
> -               int nr_el =3D get_nr_avail_ring_elements(mhi_cntrl,
> -                                                      &mhi_chan->tre_rin=
g);
> -               size_t len =3D mhi_cntrl->buffer_len;
> -
> -               while (nr_el--) {
> -                       void *buf;
> -                       struct mhi_buf_info info =3D { };
> -
> -                       buf =3D kmalloc(len, GFP_KERNEL);
> -                       if (!buf) {
> -                               ret =3D -ENOMEM;
> -                               goto error_pre_alloc;
> -                       }
> -
> -                       /* Prepare transfer descriptors */
> -                       info.v_addr =3D buf;
> -                       info.cb_buf =3D buf;
> -                       info.len =3D len;
> -                       ret =3D mhi_gen_tre(mhi_cntrl, mhi_chan, &info, M=
HI_EOT);
> -                       if (ret) {
> -                               kfree(buf);
> -                               goto error_pre_alloc;
> -                       }
> -               }
> -
> -               read_lock_bh(&mhi_cntrl->pm_lock);
> -               if (MHI_DB_ACCESS_VALID(mhi_cntrl)) {
> -                       read_lock_irq(&mhi_chan->lock);
> -                       mhi_ring_chan_db(mhi_cntrl, mhi_chan);
> -                       read_unlock_irq(&mhi_chan->lock);
> -               }
> -               read_unlock_bh(&mhi_cntrl->pm_lock);
> -       }
> -
>         mutex_unlock(&mhi_chan->mutex);
>
>         return 0;
> @@ -1522,12 +1461,6 @@ static int mhi_prepare_channel(struct mhi_controll=
er *mhi_cntrl,
>  error_init_chan:
>         mutex_unlock(&mhi_chan->mutex);
>
> -       return ret;
> -
> -error_pre_alloc:
> -       mutex_unlock(&mhi_chan->mutex);
> -       mhi_unprepare_channel(mhi_cntrl, mhi_chan);
> -
>         return ret;
>  }
>
> @@ -1600,12 +1533,8 @@ static void mhi_reset_data_chan(struct mhi_control=
ler *mhi_cntrl,
>                 mhi_del_ring_element(mhi_cntrl, buf_ring);
>                 mhi_del_ring_element(mhi_cntrl, tre_ring);
>
> -               if (mhi_chan->pre_alloc) {
> -                       kfree(buf_info->cb_buf);
> -               } else {
> -                       result.buf_addr =3D buf_info->cb_buf;
> -                       mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
> -               }
> +               result.buf_addr =3D buf_info->cb_buf;
> +               mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
>         }
>  }
>
> @@ -1666,12 +1595,6 @@ int mhi_prepare_for_transfer(struct mhi_device *mh=
i_dev)
>  }
>  EXPORT_SYMBOL_GPL(mhi_prepare_for_transfer);
>
> -int mhi_prepare_for_transfer_autoqueue(struct mhi_device *mhi_dev)
> -{
> -       return __mhi_prepare_for_transfer(mhi_dev, MHI_CH_INBOUND_ALLOC_B=
UFS);
> -}
> -EXPORT_SYMBOL_GPL(mhi_prepare_for_transfer_autoqueue);
> -
>  void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev)
>  {
>         struct mhi_controller *mhi_cntrl =3D mhi_dev->mhi_cntrl;
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index dd372b0123a6..88ccb3e14f48 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -215,7 +215,6 @@ enum mhi_db_brst_mode {
>   * @lpm_notify: The channel master requires low power mode notifications
>   * @offload_channel: The client manages the channel completely
>   * @doorbell_mode_switch: Channel switches to doorbell mode on M0 transi=
tion
> - * @auto_queue: Framework will automatically queue buffers for DL traffi=
c
>   * @wake-capable: Channel capable of waking up the system
>   */
>  struct mhi_channel_config {
> @@ -232,7 +231,6 @@ struct mhi_channel_config {
>         bool lpm_notify;
>         bool offload_channel;
>         bool doorbell_mode_switch;
> -       bool auto_queue;
>         bool wake_capable;
>  };
>
> @@ -743,18 +741,6 @@ void mhi_device_put(struct mhi_device *mhi_dev);
>   */
>  int mhi_prepare_for_transfer(struct mhi_device *mhi_dev);
>
> -/**
> - * mhi_prepare_for_transfer_autoqueue - Setup UL and DL channels with au=
to queue
> - *                                      buffers for DL traffic
> - * @mhi_dev: Device associated with the channels
> - *
> - * Allocate and initialize the channel context and also issue the START =
channel
> - * command to both channels. Channels can be started only if both host a=
nd
> - * device execution environments match and channels are in a DISABLED st=
ate.
> - * The MHI core will automatically allocate and queue buffers for the DL=
 traffic.
> - */
> -int mhi_prepare_for_transfer_autoqueue(struct mhi_device *mhi_dev);
> -
>  /**
>   * mhi_unprepare_from_transfer - Reset UL and DL channels for data trans=
fer.
>   *                               Issue the RESET channel command and let=
 the
>
> --
> 2.48.1
>
>

