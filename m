Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC27D6E2CA
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 19:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dIw8j365ikKyDlsgwjx4WaIiStWEnX4+clh7heSJnj8=; b=sGzMA1VdkcxMgm1DiOQH/549au
	eRRqE+3zpd+IfsvibpOeSB+DMuhmtLl4Xfc708t7DvmdGzTiN0qCVPifOYZjCl9j2PTKDfB1MGy5x
	abqpgWvhy1NFl3SRq/vEogP820F1I5J7qp2vrmjH2fZj7tehmOtyra8EEjPJHyQabt3UeH+zBSZh5
	cZQpoAL6NISu4/piglvxbxo2w39QLwmfOwbGKujv7Oc2pZdHqxF3U4G2FBxR6XHjr5LGvdyCKnaoK
	9P5qFfXF9lT705zDUq53jGELxQtKOxRNi/vK1WIDMJk5KPFKBxX+ANRF8qEsVZDlRR+/wT+PNTIW/
	BQMqYq7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJO5-000000093o9-2M32;
	Thu, 18 Dec 2025 19:10:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJO2-000000093mg-3I78
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 19:10:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIGnqjC174386
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 19:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dIw8j365ikKyDlsgwjx4WaIiStWEnX4+clh7heSJnj8=; b=DIC5h6JWngJRQiGO
	4a3tmpai3afMojQofFnHVDy3lNKG6BpZGEUzjmcp/bpe8UaN35zK+SPt5D/GO06E
	4ABE1JP940T2DYzfqgEtNUcI7hnyXEpArjvRgANwTV489DM4qv7YGPvynME79vj3
	Cxc/e2h3UtZMqPbr+1sFIU69sYcVBo8zLjhTk2qml3gR4yvc0HIFxWQIbP4B/KOO
	AShzwNTyQQPr5ZiODW8O72sR913m4eszaGMLaEU6o6sNSEVoc2FA9WphrjVFKDZF
	aTFjkkVZOicAJHjBiiBeHgIpLFpkY8EjO5SJv9lanMvDo6gV2dLohtyqR+cwNXcr
	eT4GgA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b43nmuve1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 19:10:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-888825e6423so20055146d6.3
        for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 11:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766085005; x=1766689805; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIw8j365ikKyDlsgwjx4WaIiStWEnX4+clh7heSJnj8=;
        b=NI87nHIQU8PkWfCdujAUv2NS0CaW8i+oWDrIi0qRWQZeMLmq2on/wxuY6HdaqEQRLS
         94XyPXhTlV9/7g7Dkv35l6xkkwfULQ4YkbjB1p5xsrReO3JKnbgPpKBgiZfKrHnM+63Y
         lf6jnDi54MLgpTxbIiM4QJ0w2m36IJnDtOseDZlYHrDpzLYdyjTDV5Gk1bpEoD2nx6M6
         g3M8rf9bPCbFsGBiA4Y3T+s/cPDyPSX+UlLFaBTeyg+kaxxuY2HxdPaB57lJ5U6plcPk
         l+Ch+OsMbyaZlSLC8XoVWrVDl6a8/GIrhqM7i5fDMywdabhEqbBONvcXGiegx4S9cUAu
         VFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766085005; x=1766689805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dIw8j365ikKyDlsgwjx4WaIiStWEnX4+clh7heSJnj8=;
        b=l6nqhwc+nTYedzTPcEeX5uAj7ofTnbJ9ht8jtJ0TaqdloqNTSv2XaqDQ2Fr643PHnu
         dpYBz1fwukAwy27BAV5a8qCwvgJ5mDZgVFDWHeg0tVnEN/BmV+BjtE4gfY7k93qZFySH
         S42ONyboyNI+xSpp2A5akxA4kY+lcLDpbiaP1Gjg4wzXUEsNFl9hlmHxLys1KIAnl75r
         eM7eqo0zd/eM6qOS3Rn1FlOcIMsmNABNV2J9QFNrj2lQ/OQL8shizu222CVADczhWmaZ
         LpWYlp5qYMnOWEb5TMP+Muu6RERLEPIuQAMejF6I9vUcsYqPFOjIpg+P0jkA2UPqiehU
         GCKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH18sYwFlZngSQr4s/d5IM8BuaTABfxWmMX/Bownmu5Vq9bEX96wa7Vlk/sEP9YoIuLEAn2Y4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwqFk37uIYzWsmAIOMSuL9YU36qzvQapR34+6aoVSCEuDVSuJIr
	wwxOHKxpaPp0s5af5DK5y2l1e6n+rPVipcuNbV0dirba/uTYD2eqaNOOBlQIrEz/4ll3vQYGpbu
	QbNaPENpqG+upFYURrdHRcHbZ4Zq5Xk6mfjzZAam5NGFGD76FM5HlyIqbdUhRKVRcKWN4zfLfAy
	zVCkHEQS3T0Jth2aULDOk6Ls3pFYTIEC7WqMOmNOM=
X-Gm-Gg: AY/fxX5x8+Oz86/4oJW1dd9xCS/AfDQJQThBY+GAkmqsz9QJuEzPDFvrb/taVGtSCt+
	jmjkO9nEdI6PAbif8lCZ4CS7hpJIKpf0sTpzV7/sBnEeX03Sk6mpLiC1+cnx2iFVklcNvtZwCMa
	YP7r0fIFY3Agm7G70IW+cA/DdNJ+C+nyx5SbSFgJnqiaFUZhwR5Ga5H0QgdB0fDB3cGJedrfnBP
	5ESM+r4dFMeLzuA1ddJ3LvXNFA=
X-Received: by 2002:a05:6214:5903:b0:88a:32db:ca2e with SMTP id 6a1803df08f44-88d8859d814mr11385776d6.66.1766085004837;
        Thu, 18 Dec 2025 11:10:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElTYAdoPhfH6LxXjgHHJuq9GB+MaXPuKPdY6tm4KOAmStZEaNhs0H2TbaWVu8vQa2PTPIgBrIHJI1918I+nRU=
X-Received: by 2002:a05:6214:5903:b0:88a:32db:ca2e with SMTP id
 6a1803df08f44-88d8859d814mr11385106d6.66.1766085004406; Thu, 18 Dec 2025
 11:10:04 -0800 (PST)
MIME-Version: 1.0
References: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com> <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
In-Reply-To: <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 20:09:53 +0100
X-Gm-Features: AQt7F2r9lOf3zDCFBlKxs8sdhKMbeErBZkq0-ox7XPW2t1SLGzCNcjhrK8xkLWc
Message-ID: <CAFEp6-3mHFYFPS=iakDyWUknDH8z4qOaHwFLuP=Qz1PvYSL_XA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] net: qrtr: Drop the MHI auto_queue feature for
 IPCR DL channels
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
X-Proofpoint-GUID: EJU0aCNkMP5R7Ub8oaKyO4q0yGMhxQRy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE1OCBTYWx0ZWRfX0dHyS6Q08qRy
 cHh9s7wmEyhK8zSktGD+Zmw3YjAvaBPbZxnLq08yK7aVgpQOVAEBq4RJRyWXj6bg3LN6oeVhCZo
 aJRpY74VW65ZTx1y5SBGNnVzo89E+3FXE/yam4ip+1F+QmAfz4E05EY3g+TbORi06EEXlHT+evQ
 5WPCH8x9ttgScRl59a+VO/goO7w5gSi1GJ8OL6+0GKhoDAOjLekuo/AdC9RkW5oRZCq0X0bG/jm
 E9l5Wgvo8sFznhKyADwWGyp+Fi6x+c83EEQ9eFVmSTso5z/1+iubjlS3l9xd5xXeQmrgNN9OmAh
 QaKNg8L4YrB7nk+ILOMaxsvUtzwV8zCldWVsXs+kZXWOWlR6GnaMeW/k8u69Ar9xf71EhWTQ8nm
 76pZNYJQLDPmhH5HpHO3/xywgiOJ1A==
X-Proofpoint-ORIG-GUID: EJU0aCNkMP5R7Ub8oaKyO4q0yGMhxQRy
X-Authority-Analysis: v=2.4 cv=A6Zh/qWG c=1 sm=1 tr=0 ts=6944518e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=isMaZ9OHK7bkWVW8W2QA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=xwnAI6pc5liRhupp6brZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_111006_825261_F1B1AAF5 
X-CRM114-Status: GOOD (  16.90  )
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

On Thu, Dec 18, 2025 at 5:51=E2=80=AFPM Manivannan Sadhasivam via B4 Relay
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
> Fixes: 227fee5fc99e ("bus: mhi: core: Add an API for auto queueing buffer=
s for DL channel")
> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation=
")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldcons=
ulting.com
> Suggested-by: Chris Lew <quic_clew@quicinc.com>
> Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/.=
..
> Cc: stable@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

