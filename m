Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E94D66BA8
	for <ath12k@archiver.kernel.org>; Wed, 17 Dec 2025 20:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HgMaZiIuQy5vybIqaOL5aswqYfbddufKQttDrC14/fE=; b=Lmfr6VpbPshINa+jRaiQ0FlWeC
	J/TTP0cQstTyNnaLTEX+9BSu/ITH9sL8Req90TcAeC/gd71tnnKqY1arpnzh7mo6PLFeZTbNnvhdC
	bBnrqotGqa8x6QWHGuPU1rqb8ZBPgW8EZj62hx/pEEY2auC/QTitySlSR43bOhyTwIPdlZGfFm8I/
	eHaqgXjEhj/cOHxxmNOzqxExseJWY8Jj7xBzKpbqhqITBr/jGvlEW1+dWNRUtAYARaw6iNt1Sav7J
	dGTWl9nL/xD1Fa7UN/ohRgMp0XGaHUoJ+g2M11tf71aHUGAD4Iwngoe3mK/zUgHfXJCJzGwBlik9O
	EJdnNudw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVyYJ-00000007PC8-2GQw;
	Wed, 17 Dec 2025 20:55:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVyYF-00000007PBI-0WKq
	for ath12k@lists.infradead.org;
	Wed, 17 Dec 2025 20:55:17 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHJBmVS020286
	for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 20:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HgMaZiIuQy5vybIqaOL5aswqYfbddufKQttDrC14/fE=; b=frgUq2naW/f3Z10b
	qhlkzoQG/bBIkMHs9pjkrJlAllgM/1Sc8QGkpXI0tnnN+20I24C9vY0ZESuahSd8
	+c2gk+U75SLx+IRGoOEweVFcWESkD3fiLfgKC1hm9Y8egrFQ/Mi0Xdip193OAkCg
	7v1UmOWgOcmGdD4PW1Lm4wGYJH6gJZYTZwpb7jlBzBF114KKcH8doXizoAbDjYYV
	tphoXAuxeMwhhpY3ZVi5ZYvA7KY36al6VVmCEDkTMCC/xFQCvLyKlRhSBolJlziI
	GXjGfORKUacLpAJRIPFOp6VL1+8oYjTPpTAzoExAjN2x/4H0DnksSMj+EMIk2RNJ
	2fgYPQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40v78hm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 20:55:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6ff3de05so57149811cf.3
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 12:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766004913; x=1766609713; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgMaZiIuQy5vybIqaOL5aswqYfbddufKQttDrC14/fE=;
        b=LAIwd7U6nxdZO4AA/oGsu9cznlll1NSuDZ0zTrEtUI6jb9bENdDsHc5v7vjQru416C
         xZ9KNMR5Lll76QB4Ki+DYsBBgGm9bCdpIZR0cRptFRKfMp9PXL13xwIv3PRTA2FOT1PE
         shH0uXucHnqK0Cp8rR2Sq+rJZwo9KCvfzJMxbbDtkNZ1IGhvHiqodEsV0FBsiuhlJuy9
         igvLo77VdfYgXImEA4vVaw5KHLCVI6RuXG7bNmY4rmv5WMQquW3/w9IezjkBi7Gnnt44
         MOlVbGSi40Bounv9VmZplfLDGyFV1UqSE1Sq73SG2TWfA9ZALfSEtKc7J+S+3l971+KP
         WLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766004913; x=1766609713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HgMaZiIuQy5vybIqaOL5aswqYfbddufKQttDrC14/fE=;
        b=rPP5xtAQjMLyKqCiiuv2ANsjjJam8PUIVNQYPPGAbwoB3llTsxbYhaFCVap3Y34iJT
         juIdb3k5vz/yAT3ZFOQGs/7Aquy1A3pLCV7DuQPFzyP1Xp2CpsuXUcy4j3FGR+mKHSra
         MGwK5aOpLCFhdcQL+V6GBV7AF18t4VakIW35689+wyKkeyBWvFPS7RcTNrMeQdstP7mZ
         SZf4OOMYchBIFsi4I4vVe2e4VtF3wrJqiM1ExUbXMZ9rfYjP8sSf3JryloymRc2Nppoz
         iEmnUokGNbfMeiRBytHANMG9nsANHhktwg3WaySSyHie+PixsdVcYM72PGozhWXs39rO
         GmzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAtRuFuTSf1Nf7JA/QtiZHnBq2y2qUdec9AU4TO65LM7k0tIHs7Y0h9yX0cWqhfUu039/IyNY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw2N/klWyQJ5ZiUsYY6BgvIl+uBrrrxY4UyXDP505/bfGoeqR+
	+YPh9bQYwR3ZEmjH5Ex0/LTxlCmf+V0vb7QqKErIJ/UHTZjWvu4QLbf+TG36wpU5o1KorQccPpg
	7ptCLhKVeSbBXxB40JE8AGePD/904H0gycZcM8KzQJw0jf0KOyH4i2E4esGeP0yxVVuSa2aAtey
	AduMhaR4NsLRSVUQBy5h3m2grM4o5dcOjmvM+Gcy0=
X-Gm-Gg: AY/fxX7FvQhgGgYMM3gNakaUp+Xul9bkGDmMUdXRN8ie7pCdAlUFJO8B4ixHecO8xBi
	6qEXCjLEk9PQHA1tEGIP1sOoJq5CtONODJN7OyX95oleiWJ6Z0mqH1RkfmbVW0yYOrADYDo4P/C
	ReBAJoQX/7gm961aNTk+F9HuqKwT/YrdworU5eO3qPE6cUjzRb/qWmvMrjYHt8L+ExUKoIoTSf9
	gVgqkwJDnJLcQ2V1Q9eOCTYbG8=
X-Received: by 2002:a05:622a:1f8d:b0:4e8:aff9:a7a8 with SMTP id d75a77b69052e-4f1d059e6demr255486281cf.52.1766004913122;
        Wed, 17 Dec 2025 12:55:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIxV8yAj25Ai89Xzbv01C4M56wH08D8F+HimFkmmUMgUnz2y/j/qSKVn3Br5Bb5T4cygsAlkkPPFEOhhJoBLc=
X-Received: by 2002:a05:622a:1f8d:b0:4e8:aff9:a7a8 with SMTP id
 d75a77b69052e-4f1d059e6demr255485861cf.52.1766004912714; Wed, 17 Dec 2025
 12:55:12 -0800 (PST)
MIME-Version: 1.0
References: <20251217-qrtr-fix-v1-0-f6142a3ec9d8@oss.qualcomm.com> <20251217-qrtr-fix-v1-1-f6142a3ec9d8@oss.qualcomm.com>
In-Reply-To: <20251217-qrtr-fix-v1-1-f6142a3ec9d8@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 21:55:01 +0100
X-Gm-Features: AQt7F2oMGXyRcd9Myafrtktq7XvNVC31AVGxMw8-BPcHboXB0o1yL4pAKjFRRZ0
Message-ID: <CAFEp6-0iuJNDM9hdU3rWns=Vst6Ev1iyNim1ngRH3Z44CHwTAg@mail.gmail.com>
Subject: Re: [PATCH 1/2] net: qrtr: Drop the MHI auto_queue feature for IPCR
 DL channels
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
        Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: n81vL3jQ8XDttV1utjJV2mPNX6f1GQlM
X-Proofpoint-GUID: n81vL3jQ8XDttV1utjJV2mPNX6f1GQlM
X-Authority-Analysis: v=2.4 cv=f8JFxeyM c=1 sm=1 tr=0 ts=694318b1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=b7YbY6zhk6ih5Eb82B4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=xwnAI6pc5liRhupp6brZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDE2NiBTYWx0ZWRfX0sLQzwGKhI9N
 pU8hvijMjznc6aa45zIm7XK6Ojmq/4Sn13H//5f/+2imd3Rpx7pnf8Gb4KFSv4U2+4iBzxf8GrV
 oHUdvv5BqO+6tR2tGhOnys5bY1UMAehPPT3zgncleNgCmFYjK08JADTzK00ZcnEn7xerGG8xDFd
 PdzmiV7zyMBJKHhleJoG88Yn+SNsrRSPy+oh1MYyIjS++e3EeZJbjyFFa4t7AVu/8q1Z8Mli+ST
 9tguBYIa1v1x7rAVQuXPEOpeumyaJm1uh1ySgyKYKwq8fGCzFZlKDxqY66qpU17vq8zwYtJllLv
 nFZ7mGQA+myilOtqf9NvlTKgv+rNMWcTW8oHjL3e6iXxN2Is1oIULqlb+3UO+SgCmYUr42wufG3
 33o8zNvmvZ3d9PGQ8yOlG45AqTNpXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_125515_314029_018BDF29 
X-CRM114-Status: GOOD (  30.91  )
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

Hi Mani,

On Wed, Dec 17, 2025 at 6:17=E2=80=AFPM Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> MHI stack offers the 'auto_queue' feature, which allows the MHI stack to
> auto queue the buffers for the RX path (DL channel). Though this feature
> simplifies the client driver design, it introduces race between the clien=
t
> drivers and the MHI stack. For instance, with auto_queue, the 'dl_callbac=
k'
> for the DL channel may get called before the client driver is fully probe=
d.
> This means, by the time the dl_callback gets called, the client driver's
> structures might not be initialized, leading to NULL ptr dereference.
>
> Currently, the drivers have to workaround this issue by initializing the
> internal structures before calling mhi_prepare_for_transfer_autoqueue().
> But even so, there is a chance that the client driver's internal code pat=
h
> may call the MHI queue APIs before mhi_prepare_for_transfer_autoqueue() i=
s
> called, leading to similar NULL ptr dereference. This issue has been
> reported on the Qcom X1E80100 CRD machines affecting boot.
>
> So to properly fix all these races, drop the MHI 'auto_queue' feature
> altogether and let the client driver (QRTR) manage the RX buffers manuall=
y.
> In the QRTR driver, queue the RX buffers based on the ring length during
> probe and recycle the buffers in 'dl_callback' once they are consumed. Th=
is
> also warrants removing the setting of 'auto_queue' flag from controller
> drivers.
>
> Currently, this 'auto_queue' feature is only enabled for IPCR DL channel.
> So only the QRTR client driver requires the modification.
>
> Cc: stable@vger.kernel.org
> Fixes: 227fee5fc99e ("bus: mhi: core: Add an API for auto queueing buffer=
s for DL channel")
> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation=
")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldcons=
ulting.com
> Suggested-by: Chris Lew <quic_clew@quicinc.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>
> ---
>  drivers/accel/qaic/mhi_controller.c   | 44 -----------------------
>  drivers/bus/mhi/host/pci_generic.c    | 20 ++---------
>  drivers/net/wireless/ath/ath11k/mhi.c |  4 ---
>  drivers/net/wireless/ath/ath12k/mhi.c |  4 ---
>  net/qrtr/mhi.c                        | 67 +++++++++++++++++++++++++++++=
------
>  5 files changed, 58 insertions(+), 81 deletions(-)
[...]
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index 69f53625a049..0b4d181ea747 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -24,13 +24,25 @@ static void qcom_mhi_qrtr_dl_callback(struct mhi_devi=
ce *mhi_dev,
>         struct qrtr_mhi_dev *qdev =3D dev_get_drvdata(&mhi_dev->dev);
>         int rc;
>
> -       if (!qdev || mhi_res->transaction_status)
> +       if (!qdev || (mhi_res->transaction_status && mhi_res->transaction=
_status !=3D -ENOTCONN))
>                 return;
>
> +       /* Channel got reset. So just free the buffer */
> +       if (mhi_res->transaction_status =3D=3D -ENOTCONN) {
> +               devm_kfree(&mhi_dev->dev, mhi_res->buf_addr);
> +               return;
> +       }
> +
>         rc =3D qrtr_endpoint_post(&qdev->ep, mhi_res->buf_addr,
>                                 mhi_res->bytes_xferd);
>         if (rc =3D=3D -EINVAL)
>                 dev_err(qdev->dev, "invalid ipcrouter packet\n");
> +
> +       /* Done with the buffer, now recycle it for future use */
> +       rc =3D mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, mhi_res->buf_addr,
> +                          mhi_dev->mhi_cntrl->buffer_len, MHI_EOT);
> +       if (rc)
> +               dev_err(&mhi_dev->dev, "Failed to recycle the buffer: %d\=
n", rc);
>  }
>
>  /* From QRTR to MHI */
> @@ -72,6 +84,27 @@ static int qcom_mhi_qrtr_send(struct qrtr_endpoint *ep=
, struct sk_buff *skb)
>         return rc;
>  }
>
> +static int qcom_mhi_qrtr_queue_dl_buffers(struct mhi_device *mhi_dev)
> +{
> +       void *buf;
> +       int ret;
> +
> +       while (!mhi_queue_is_full(mhi_dev, DMA_FROM_DEVICE)) {

This approach might be a bit racy, since a buffer could complete
before the alloc+queue loop finishes. That could e.g lead to recycle
error in a concurrent DL callback. It might be simpler to just queue
the number of descriptors returned by mhi_get_free_desc_count().

> +               buf =3D devm_kmalloc(&mhi_dev->dev, mhi_dev->mhi_cntrl->b=
uffer_len, GFP_KERNEL);
> +               if (!buf)
> +                       return -ENOMEM;
> +
> +               ret =3D mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, buf, mhi_=
dev->mhi_cntrl->buffer_len,
> +                                   MHI_EOT);
> +               if (ret) {
> +                       dev_err(&mhi_dev->dev, "Failed to queue buffer: %=
d\n", ret);
> +                       return ret;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
>  static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>                                const struct mhi_device_id *id)
>  {
> @@ -87,20 +120,30 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mh=
i_dev,
>         qdev->ep.xmit =3D qcom_mhi_qrtr_send;
>
>         dev_set_drvdata(&mhi_dev->dev, qdev);
> -       rc =3D qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
> -       if (rc)
> -               return rc;
>
>         /* start channels */
> -       rc =3D mhi_prepare_for_transfer_autoqueue(mhi_dev);
> -       if (rc) {
> -               qrtr_endpoint_unregister(&qdev->ep);
> +       rc =3D mhi_prepare_for_transfer(mhi_dev);
> +       if (rc)
>                 return rc;
> -       }
> +
> +       rc =3D qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
> +       if (rc)
> +               goto err_unprepare;
> +
> +       rc =3D qcom_mhi_qrtr_queue_dl_buffers(mhi_dev);
> +       if (rc)
> +               goto err_unregister;
>
>         dev_dbg(qdev->dev, "Qualcomm MHI QRTR driver probed\n");
>
>         return 0;
> +
> +err_unregister:
> +       qrtr_endpoint_unregister(&qdev->ep);
> +err_unprepare:
> +       mhi_unprepare_from_transfer(mhi_dev);
> +
> +       return rc;
>  }

Regards,
Loic

