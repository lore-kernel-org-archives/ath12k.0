Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2257AC4452D
	for <ath12k@archiver.kernel.org>; Tue, 21 Jul 2026 10:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNVZLfwCsaGZu+dN7KdgMrqhUKre/8+4rzOhShj+rOc=; b=LUCPkqaEZFGdDMKU4GnuR79FGj
	Gqd3mY/C1rbtRanYYz7JZ46C54l1GQ9XNShDomJJPwL1YYn3QNxnHD1bcdxDieJj9OKqiZPif5owr
	qe5DD9dziSimkQ2lVJ/n5YMb0OCn1+2UsH1kMQGgbbM49qciAwf6CrGxc6MSG+PSHd5eyHezkhRYS
	XoBZtZ9ujfB8ajpNjCax3GFrEixIXDcjxvTk+jeV3n06lNi/JQFZTCnTXgLZ6ApsHzCc265K5f/u6
	sYDxmoSSnzeERPOKSRMYh693FtAFWO27koy+y+5nhJcYVEyY+3QJ3DvoHV5KZUgbTDwvlzqGnu342
	tp6JFPmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7dU-0000000974k-2zfU;
	Tue, 21 Jul 2026 10:23:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7dS-00000009741-0aae
	for ath12k@lists.infradead.org;
	Tue, 21 Jul 2026 10:23:39 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L7vZ48043236
	for <ath12k@lists.infradead.org>; Tue, 21 Jul 2026 10:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNVZLfwCsaGZu+dN7KdgMrqhUKre/8+4rzOhShj+rOc=; b=YkZU9qx6lnMX4N5K
	Do0b62EpRlotw+/e8mEbhWDllZ3QfTEvVcxyBwNAymMa+RQMcZQyFEuQy7fXxd9Z
	rWH4cWFfbPEGE74FlVO+pJA4iZDM+btPk9jltI5eWsv1UAL6mEo05qZHc0IR+y0z
	RJsUEtKoGNdiMaoLigiqBrxnJsAIW/jkcyEcEb2/Ff2hxrfXhIsfC3c5NR0SSa5G
	7y0HXEdC1VzjBR0o4gRORznyxuibrXiiQ2YD0U1oyc1mN4nSgSvfjlan7Iy2q5or
	tQ7kd/Y3Ni1XNudl9Rhgf4CDLVN9VCLP+AO3YviOI66wsozf3nEO/8J4yKJpE4ju
	0TPZmQ==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as22dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 21 Jul 2026 10:23:37 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6651da40ecbso4142910d50.1
        for <ath12k@lists.infradead.org>; Tue, 21 Jul 2026 03:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784629416; cv=none;
        d=google.com; s=arc-20260327;
        b=AZJNuD1Bv3q/dj0Ed6LedUkOoXiil7XcZ3i52YNf2UGbIWYqIDE9bFsesNU6pY/7cy
         rJQIdGkQARdSvD41LsS/sd2WtQr1LeIMRqoVGdFD4edSWs7MhUrsEmmiY5gcayJjK3d8
         9FBnFbnDReJjknI905GaVcS9O6q5LXIgqffRNcom93BewsTZU8HxigqX1DfW2kcQ3Z02
         YHQvplYegmA063LK1JqxrEyHwY31l7f0jT1GsyyYpXxY6OeWNpSlShQsJmQjmWBiF1y4
         RLXtcAS+TDCJJEmhBhGnwUV9svzgLfZlmYL6gWuYT2F9BTbHovzg6xGnFkQTcYe6gQw+
         7NWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNVZLfwCsaGZu+dN7KdgMrqhUKre/8+4rzOhShj+rOc=;
        fh=ztC94SMIB3T3uUSSaP9k8XJX1H9fBHmKJPoXBO1oS3w=;
        b=axe5uZyaNfeSdKBwIQ6DBwHmA+eOmCm0gjSf9Wpt3L9xuzTS1i/SVkri7jSPiyZ8Yu
         aEl9x2hZCkdbdCtFL7P2Cv+Fj6dFthIFwiNFk2mYgMwv0LLvdBclmPaE6HAQpkWu8TWp
         O1XYnWdPkUE9AEF5EpYTK43czwsJdwxJEO2TKTAOx1M0X2+PyndvMhAyWP8VFDvPkrPw
         52GWnz1igEQEWeYGg7RZ6+w85y5OKphkO/VaZlopteHwnhZw19HNZaQJZiewUiKjI8JN
         TJXvK4Y3mpucblDGA1ve9CbbwdAUT2nTvQMsaOvU9+jf88lVT/Yz2qwLIdJEd3yLulzm
         MVSw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784629416; x=1785234216; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNVZLfwCsaGZu+dN7KdgMrqhUKre/8+4rzOhShj+rOc=;
        b=DXPioXBgXPzI5rcfFymsE/SUsbH/qoXnUEQ/9qcqhqCnea/6bV1ruYO4YidFtXVePz
         3WRtxigW/HY2lj+DZVtP2Xtd5zejv46LzDtC8yMFCL0m2yvFBNLmenx50I8BC9yOgVEO
         NLDoj08JUY2mtuBRSh7ZVsre2G1sI9m89LioyQaFmPAAP2lRSm2VCPE9/IYTesFFpGb1
         Yrh2WFxLvDaIj6k1lk3sV7kzoUcV3mP+6LA13ArrJhKjqLEXWBB1PZPVD/q0d0CYWThB
         l7Cd5PxUJiBdPGOfmVV1H9Kesit7nn/nLX88YOd/muYBHPFPyB8uU1ffxw4Usdmqdt7k
         KVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629416; x=1785234216;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNVZLfwCsaGZu+dN7KdgMrqhUKre/8+4rzOhShj+rOc=;
        b=ZaphFAuv8sWvxscgd8WgpQOp1zgJBMl+swc5mX5OD8Izr9lbKUWLK+URB+C4hfXvfh
         KKzdvaeK2K4aXn57iewfuZ0Jl3d73nmI/lne7AsZY5BLBrgROa2LwjLaC6PTB9c0fj+E
         6wvgg+NcGXdEP2tMCv/Z5xrzw3/5nnmJ9MVwmXcJOA+2Mvmv4TbuAODs0jDH1aQ/Lu8X
         bAQumpORyIM5QZ1KoKkgY8eU2qkBmELuk2LGt5KTCgyoe4A/KjKSqqs0X9wjCi/53FRn
         LyWim6QAuvn8bQKXEA+e9G+EDaPWCdUK8EexTVEwzEc2HsTE71Hal2w/Z3NiXnjm/yc7
         +C8g==
X-Forwarded-Encrypted: i=1; AHgh+Ro+nomq1W1Zwa+m5kJ9nNT6vJINC1/O/UbCZARzUkBfYl8l4MCrGOC1YglVeS0DbIDH4ND2bEM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwAr3HJitYuVm2ouIMFFKDOXUK+zP5FtccOamoWsAq9BPSF/PXt
	BvmA6nKF494uDJw9mhwbPv3Z3V3f+0zxoNoLNqQzh/4W2H8vcMECHyglZEpDHAgjRCWAAc+ilvJ
	hOAx7LS0ccmW2nhX2cI86KeM659eRpW79YNYV4vxpseyyceAMRb6MiG6r8rt7csHCuFp0nB5PbK
	za2wkCfDNGNKg/T+3U1Vm3FQjYMCY/ZfA97HMH258=
X-Gm-Gg: AR+sD11UIRLrbH5RndyYKSZ16PB6ptgrUqN7RAF6buVSvajS6VtQhgaq+i3g9CVsMk0
	ouUvpnYmr7sjovPD/FAIbZ9ZRXIiVT8qLUgC2W+/7ArqnZ8ak9Qp7e0eTpAjw2XB+Z92Xq1w5xW
	1IxIIOIgAvz6bpKhNGGybli/gPCVianEE4e1sSxgbjZitMsGeuD1wDox0ybQ==
X-Received: by 2002:a05:690e:148e:b0:668:85e8:7cb with SMTP id 956f58d0204a3-66885e80a8fmr310942d50.38.1784629416519;
        Tue, 21 Jul 2026 03:23:36 -0700 (PDT)
X-Received: by 2002:a05:690e:148e:b0:668:85e8:7cb with SMTP id
 956f58d0204a3-66885e80a8fmr310932d50.38.1784629416151; Tue, 21 Jul 2026
 03:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <20260702115835.167602-10-sumit.garg@kernel.org> <alJpc3nFX9D7_8i1@baldur>
In-Reply-To: <alJpc3nFX9D7_8i1@baldur>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:53:25 +0530
X-Gm-Features: AUfX_my8FmFS_RPsD9P_wAO_xi3w3rSS9J18xqmBVD6VnuXnMyKuUdz39cXSwBQ
Message-ID: <CAGptzHP8EQyvx3tn-ZVWZPN6TwFec-ADvAuxEQhwQBE00Sg=Kw@mail.gmail.com>
Subject: Re: [PATCH v9 09/14] media: qcom: Switch to generic PAS TZ APIs
To: bod@kernel.org, mchehab@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDExMCBTYWx0ZWRfX+lI4vAAygI/x
 hFbkSo9KQWUJgLTfktaF4p2lrdpXd2IEUKoGEooHsZM0qjpbKFeK29hlzgBlzesoMajQJFF268X
 eu15uDWlbgTgep9ex2QaAbQETqm4o14FLHRsTxc5DPtd21B6XY+r0YHZBmBpo28g0U0sjLbBV7c
 ix36Y9yZbP4guZsBHVKF8d6u5ALm9hO6E6JrqgSY/Cze4gNkVXLiCPCVnnf3KEFf6yiQZMdY632
 iZpvzLK7n1moZ90db5x8v4pQYhk5xcqptxSHce3Gaa27yEhGr0ydt9j/+g5iwmYrmL3vzPXa5vh
 v5+Sg9riLcD21OutrPXm6RjzvwfgjwZNGdiw9M898hTPMeWuJxb0nYXXeS0AieNpT0xeQEII0S9
 +UKvJNNZ2NBsoNXelsHtfzSTZ4oc/K72rVTY28kzJ3x10+Cm8QoDMH9k4ZtZESjW6hBrZ/RezML
 nGQ15Y30svvnss/FKNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDExMCBTYWx0ZWRfX5LOZ9jJ8+jfJ
 s1BHGM/03X1MHIQ3fHPXHspUFf0zNPShpUCPvPcojYyQqeqJSewGpcMqGcLkCBMXKS7NkYJES53
 WCHRb2c+jZRwQW2SI6b2Uvw4RB8hL/Y=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5f48a9 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=lt5aTsHmsBbDyw7JONsA:9 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: 3I3auKF-OVHc2mooqPnoHrsMG-xbs3C2
X-Proofpoint-ORIG-GUID: 3I3auKF-OVHc2mooqPnoHrsMG-xbs3C2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032338_185181_BB3045BC 
X-CRM114-Status: GOOD (  18.40  )
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

Hi Bryan, Mauro,

On Sat, Jul 11, 2026 at 9:36=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Thu, Jul 02, 2026 at 05:28:25PM +0530, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >
> > Switch qcom media client drivers over to generic PAS TZ APIs. Generic P=
AS
> > TZ service allows to support multiple TZ implementation backends like Q=
TEE
> > based SCM PAS service, OP-TEE based PAS service and any further future =
TZ
> > backend service.
> >
>
> Please find an immutable branch with the dependencies for this patch at:
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 20260702=
115835.167602-2-sumit.garg@kernel.org
>
> Alternatively, if you think there will be no conflicting patches in the
> time leading up to next merge window provide an Ack and I can pick this
> through the qcom tree.

Just a gentle reminder for this patch to be picked up as only the Qcom
media client is left in the next branch for migration to the generic
PAS layer.

If there aren't any conflicts then please allow Bjorn to pick this
patch since the cleanup patch dropping the old SCM APIs is blocked on
this.

-Sumit

>
> Thanks,
> Bjorn
>
> > Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---

