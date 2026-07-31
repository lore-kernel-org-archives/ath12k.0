Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BDCC5516D
	for <ath12k@archiver.kernel.org>; Fri, 31 Jul 2026 08:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0aS3a1IldF5Hbms4X/oaN6dyR7C27AUylN470557Iek=; b=iO0l43DqMs99UOPFYz1hLXZ/ac
	qaB9AdHlmtEv7ytmmO0Tx3gCikS2HxXs6eg2wbC+xCHDhT1nAMIvoXmgfgiNlQxjF/AY+WwdvRosA
	3ryuA0JezVVZvT7pW9lQuWzyXjOS4SrWaB4Uljt6C+Qf866tu1yIqtAbhZyALibqOkQEkQymqH8Db
	yeZtuUI4jGq4VJNMjgs5LZIRjbVuJt8EaMAnijMcwpAauq6N4RhL6HJa97NdXHxrYPs/w+9s/Oppn
	8UA1wmEdZaJ1KB3XFUrpyGrT/PrDft1lxJMziB4nLONxJIHPBvCqZDfIdu9vCdgPcHks/jaS2ldMG
	Ms12KpEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpir9-0000000C5wi-0Wdk;
	Fri, 31 Jul 2026 08:44:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpir5-0000000C5vw-1p9R
	for ath12k@lists.infradead.org;
	Fri, 31 Jul 2026 08:44:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8ZvVN3476454
	for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 08:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0aS3a1IldF5Hbms4X/oaN6dyR7C27AUylN470557Iek=; b=Y0426o5DtAmpV+CI
	pa9mC3woijvQAOSlCbxssCTGjzH/9SyPVjH1jOdc4ONy7HX2LtjtlCQZV+pBSORq
	BMyq/waKEb9hCO9u1nC+yzqk5caF6dVBfg39rEORc4E3d2GR1iJnWThRE1Ynue09
	5ebW5LPfCkp+baXesyO7CTvBAVuI4r+HRlj7S+l8tX42yRy3/qGBaS4hm4xnJapX
	zj+ZUOXWxFNFl6VWRYa89+uKWtPxfiYch5T65AY3hoQSRou9jxqZBw2oLajdiXPX
	nSwn4106VfDFAUzryNFM3GOgDiJR12oimHPrSoryWJ3NgQCOkmKERuam0pOUatkh
	GEvotA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frrb901cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 08:44:33 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-49d4cb3ca23so995831b6e.3
        for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 01:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785487473; cv=none;
        d=google.com; s=arc-20260327;
        b=MuNIPkUDvrx/jRcrVBEBJulxc/kyRNvsyvwSahOe8hKB8Lawf07jpA60j52GKkl6qT
         MIxRl9unwcFedr8f1r5FCO66S0+y71iAOrF2ltwbDwOocThiaTz4HX5oycxT8r4e1F+0
         ATtgZOpRPlBdzZmiwivtm59goa7ZNcBihHqlDWm7KBAk5O7dbHcHkrllmcqTSr8CpX1a
         ETFDvZ+J1ZD7Q1nOspe4mW5PF/L9mciPepan/5C6OXWM2dIKxdtHDk6x/0cxyVEgbVPJ
         h/6zHtj0YOiSwBKADftdK/jF1o5OWPVapBWIVLhTuA8dEEvdhaIxVGpE1xHFCtBeHdkg
         ZZ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0aS3a1IldF5Hbms4X/oaN6dyR7C27AUylN470557Iek=;
        fh=fqfV1zEGCjMrmvrt3ooi7pDL53nPDUwvIIjw2Sjc+wk=;
        b=diphmMVIdo3ZDU/b/b+nz68MR2fBtWQSnihiOa+x0RNFy2Ck309h0Z2M4WZh/uPOfU
         M2nPLvjMbF3J4SPsQTBsoVo1uo6j9pa9toGrYeEp3s359j7kd5vMkmP8McuWUnAHfhUg
         FXSk77qQqh9ti4ckXaf0EhpNd+bV/Vfq02p2DrVhOQ6KQKnfd7Ue1rxPy282+ZCPf5hi
         RwZzlhXhiEKJ6+eYqPR6dFNaDm5V7DUGqLe8GM3Ugj4qsONgEDyL4iTn/Wx2Yw5I4pTt
         B1pcjVxZ5uobqsWnTaZRORVZivQShrsu7zw/K61Szmi5jqndynAqt6F3fLPQCOFmb5DE
         WCYg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785487473; x=1786092273; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0aS3a1IldF5Hbms4X/oaN6dyR7C27AUylN470557Iek=;
        b=ZjgH/1nTf4dCVhjBycrXAA8DcGbjOvligegRizIklOgo7c1qQbY50ly7JUDJCYbTJi
         eTAm1n/w6AQMVd5BBcKJuFLyqmhQNt9O0GbTUB/8Ol1CmqGy8nSyRrhuuxtNcmGiqjeR
         BDFHeUqOU6+EfiUeQwbWP/7Sjq4Q6lVJInPdzUq02GTvNlCy6JEmOTPfShRLuR8snYyX
         ioAGanWqZl9exE+Ff52AM5bXz/7vIquFhhs8xhO736iJgYPfcF6CQj9vf4wZa7Ma7vXC
         4nVZLONUBO9fITCkPL1+CtWwq0Y5TQg94XA9DLWxguivzLl6sU64vkiXCNmCL8pqTVMi
         U0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785487473; x=1786092273;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0aS3a1IldF5Hbms4X/oaN6dyR7C27AUylN470557Iek=;
        b=lvDt944ZGxLtfIbTAEx238DFtEq2yEyy6fYeJjkFVnWXhZ81UKKYDdDE8mfyD95AOu
         0HuRb/auJcUFD74TF4bs6qVRsnjXFWZcDABB+CZNJBtyRvOoPEgJvuDzMGuvj3lK/ko4
         AXKyBjy2rF9p7V2ges1xx/kwsouLGXdAFdHJnJg1yLsyziUDEhmmhu573vAQnVfNe0lL
         K2+0803yKaSUOBMy04nbqkc9GUF8xWa3cOefRd0N/Zt/ik8FXDim7bO3U3Po6k/ocaMq
         U38m9XZvZfrfciUxYUTVvKYLVs8g373Tm1DBt5v/jv5WkJUhFsN2QODrFuVvKtOD88AI
         fAVQ==
X-Forwarded-Encrypted: i=1; AHgh+RojuRz2VJ9GBezjRBNtW7ZrswJOWaVWZMNKjPYXcSxUQ/Vp1N/Obuy699Wr1N/wcM2VCNrLBj0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyO4jkG9d7js/MtB6V/Gidg6QRpnzGzbWL0F0XdhHRDVKLEYGmj
	bQJkvAj5uf9o7nTyNhPWX2Qy8bG1/PlGHKFDVEwrTClHezVc90JzRl80+6CbOaanzGpWAp7AsZw
	YWXBlfwN4k7bjO0mBC36F5l5HBv1VyMKHefJoJ8nAzXVvlDfdgoiAKAg+UBqc+LfbH61s8Z6zhU
	uEG0zfe6v5rH8RZK4bEyzK5CDFfZhcBPpRV2X7QJo=
X-Gm-Gg: AR+sD11gr68fQfkUvFyvJQFiI0qkKSIqNN17mOL1Rrt78px9nE+3BC2gqIJv5vDSh5B
	VuRHKbFr7nFiFSkY5dFyxVuj1Qe1ZAi1CNKYeyKnDYQ6kOvbrND6pJNozG+cTUXbbLqL9ve2TOX
	OAH28aekTV7MVDHjK2BckOudJX4LWG/0ZreXdP8CLZCcBZrdfnFBe60iDt
X-Received: by 2002:a05:690c:7305:b0:81f:650c:98ce with SMTP id 00721157ae682-81fcba86c09mr6967617b3.31.1785487167419;
        Fri, 31 Jul 2026 01:39:27 -0700 (PDT)
X-Received: by 2002:a05:690c:7305:b0:81f:650c:98ce with SMTP id
 00721157ae682-81fcba86c09mr6967197b3.31.1785487167009; Fri, 31 Jul 2026
 01:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <20260702115835.167602-10-sumit.garg@kernel.org> <alJpc3nFX9D7_8i1@baldur> <CAGptzHP8EQyvx3tn-ZVWZPN6TwFec-ADvAuxEQhwQBE00Sg=Kw@mail.gmail.com>
In-Reply-To: <CAGptzHP8EQyvx3tn-ZVWZPN6TwFec-ADvAuxEQhwQBE00Sg=Kw@mail.gmail.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 14:09:16 +0530
X-Gm-Features: AUfX_myayjkpJROHbmEgd6_YM-8VOlEVu55qy_zXpmBuYnmJ9VMnESXGGquBttM
Message-ID: <CAGptzHORxaftDtf9K5pCLORK0kpdfP4RGRSE9iNkm0Bf+ZqmGA@mail.gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2MyBTYWx0ZWRfXw0//ichPhUOP
 QAA5ymgc6RIbrxHa+zvsLYGPBOKyuiLRLbDw/U80s8xzL/tdzTD0JbBmtxiBBqhH1rJ3ZUVCb8P
 EkrnnZCBnZySgV+32C8J42vWODdiakY=
X-Proofpoint-ORIG-GUID: SPgRfc-pCZ4IEDqcVqAAIIAneh25Ktzq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2MyBTYWx0ZWRfX2/MLBmHhI/SO
 6QFortAGQGmumbVQt4c0PomU7Ie94yoBqEbPTRKuLfuLV4JDTgG7fVhbESKrL3eED+Fo+VPxH7e
 F54rCje8kgIbGiiSN5K8ocsDUB38v2JetZPQEFxpVwgVY7YDR3e7asHF7yW+DUj4VQGxE1EnILm
 dkeQ97W6FG0I/xe5mZm95iFsaaXRXpvxe+1OIRbnNuU+TV1TSrpKE4R8+4+HXjCUcBO3T2/dt5B
 rk33XLT0OAjLsVOLVFhFDumNE9r9NulIFjjW9Ftya2ZoIepiIv1Hx18q2SSTDFRL3P7TSyLLbJJ
 zbfQ+EPvJjRqskkCvCWrnf4wGUDTr8MD/cDPkLbL7K71z1nX3SDf8tjaj1APfvKk8NBm5JCca+c
 Jvz6OGmTyjknctqYjdPkSLnpuyACCy6NtLzUt+VArp2bbaDozAKaVjK03Hny3zXQDklTQRjkjNP
 GkSExKJ+TvhZGzIvgQQ==
X-Authority-Analysis: v=2.4 cv=c4ybhx9l c=1 sm=1 tr=0 ts=6a6c6071 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=SwCItUvQPH3YegUC7JoA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: SPgRfc-pCZ4IEDqcVqAAIIAneh25Ktzq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_014435_978810_50F69DE3 
X-CRM114-Status: GOOD (  22.99  )
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

On Tue, Jul 21, 2026 at 3:53=E2=80=AFPM Sumit Garg <sumit.garg@oss.qualcomm=
.com> wrote:
>
> Hi Bryan, Mauro,
>
> On Sat, Jul 11, 2026 at 9:36=E2=80=AFPM Bjorn Andersson <andersson@kernel=
.org> wrote:
> >
> > On Thu, Jul 02, 2026 at 05:28:25PM +0530, Sumit Garg wrote:
> > > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > >
> > > Switch qcom media client drivers over to generic PAS TZ APIs. Generic=
 PAS
> > > TZ service allows to support multiple TZ implementation backends like=
 QTEE
> > > based SCM PAS service, OP-TEE based PAS service and any further futur=
e TZ
> > > backend service.
> > >
> >
> > Please find an immutable branch with the dependencies for this patch at=
:
> >   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 202607=
02115835.167602-2-sumit.garg@kernel.org
> >
> > Alternatively, if you think there will be no conflicting patches in the
> > time leading up to next merge window provide an Ack and I can pick this
> > through the qcom tree.
>
> Just a gentle reminder for this patch to be picked up as only the Qcom
> media client is left in the next branch for migration to the generic
> PAS layer.
>
> If there aren't any conflicts then please allow Bjorn to pick this
> patch since the cleanup patch dropping the old SCM APIs is blocked on
> this.
>

Gentle reminder again for ack on this patch. We don't want to keep the
legacy SCM APIs just for the media subsystem in v7.3 release.

Can we consider it as a silent ack for Bjorn to pick this patch? This
patch doesn't make any functional changes but it's just about renaming
APIs.

-Sumit

>
> >
> > Thanks,
> > Bjorn
> >
> > > Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > ---

