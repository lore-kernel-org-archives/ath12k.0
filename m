Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F0BC98302
	for <ath12k@archiver.kernel.org>; Wed, 23 Sep 2026 15:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/PeU2gEC3LoYHxgoHpBg+aDS+BEleaPfi9f+JiK36Js=; b=0zcTZtGbVXtvYNSbzrjuSST8bz
	xlCcsZgPTY5/JZDTWdrtPLYffgZsF9xbzrjx98SKfPjw4obdC5ZxpJSjCVddZ3izMJcFH6N5VxB/p
	N4kaYQYENBSOMVuVbve8yhClfAJV9hiIJMZ4peYYc5eQMooQXLGenITOygl//MKoiNcCIu6eSTZJ/
	sstzrGTSJp9JGt+r/Tpzu8P1fieBcaVGcTOJ3s134UR5aDU6YlzALzfnD9GjlyW5pcbpOFBjnBPJN
	YBENX7Uyh/YrLQnh6n7kY9UxWTkrQs+1TBtR7+6CQGDSksfWD3XCwDbKvu5L44pwtMPxB9SXuSzLS
	qJwHB8og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OVs-00000008cb1-35i0;
	Wed, 23 Sep 2026 15:04:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OVq-00000008cZZ-2aXN
	for ath12k@bombadil.infradead.org;
	Wed, 23 Sep 2026 15:03:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/PeU2gEC3LoYHxgoHpBg+aDS+BEleaPfi9f+JiK36Js=; b=ZsbE2i+CRGyTvtDNHAxb7z/OYt
	OpJJo3vHEzW591S/oKmfd7vBeIJff0M6n5qJr1s66FaVqC00DEJGSzhOYUnn9FmMKJp0w+WacgP9n
	q5foEovftLYjc4HnhOcglg9Vg7PdTLbH+/mnnMsQODiwctoXn/CqkEFGxmKNwicsdPPn48lGDbHrs
	/DQIXMsAWyLw5Q+x0knhBw6mEOjnG8BkI8h3mZJgX2dIW6SF8fkOf5uvCwHqVHBiKx9NabTwp3Ou8
	UhJlCGd9EoxedS/HgKIA07agYcTV+ObbpqtZ+A2v9/L2kXYiNhDGBDZew8K+c66C+48voNCV+gX8S
	3QDhcUsg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9OVm-0000000EtmM-1FCS
	for ath12k@lists.infradead.org;
	Wed, 23 Sep 2026 15:03:57 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDLewL178325
	for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 15:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/PeU2gEC3LoYHxgoHpBg+aDS+BEleaPfi9f+JiK36Js=; b=DEl3D4b/MaQwai3J
	Rc+Ru+AqBDlYi16WsBv2QLOrZss1Lb1ZCPQaal+Sle+OwKskQ+snUYVyT+yNJ01A
	F0EN9a3fIwy+dh6RNxn0j0O97M3Ghajsv9xbNbmZIefIpu6tVOh518WaktBrsTao
	6oeuHsh2TUYpTtNu8TvZJ06p0huj0qVwZHVOIFqNXV2mYmroJ2YVyYD+mNDEY2PI
	WEpk+pNxxufNYo7Oc+PmbtPBI5IaQRShwKSfQVexsbeZpIm5nyFeain6juIhH9OA
	hY3neNnzwcAqrav+o2rbpDeQqiwC+IhDhfPEydTnYmOV0kgpTGZ/E/Bxmx4bY0uz
	XWNVLg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxrfr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 15:03:51 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-79285c98038so918653137.1
        for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 08:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790175830; cv=none;
        d=google.com; s=arc-20260327;
        b=As1/+XAaeKHCRSzvhgSIW/wtrqW4S1LwN5FtyjUIaIhXz8h9mtbj6ZQQN3bidGgHf6
         a4pepCnz4XNYcMIMxKduXL4faTmSpPoV/IftknrxfNMsEcqZ8ruV5IHxLVwk7edlSyR8
         hm+heWr7xL7rOO3igAQwKGPVqYzopHluiAycm7Ywourc0RImAuVQwFQWoNdsX6ehEtaU
         do0R2rAp9m6vp2ALBeu1pkPM9q/REnJBY6bQHmUCStQqlVpp+aKKNHjWspVVpYFNA67Z
         egN1fvssiVSuCN+A+W/t7icR6blXR2PY1X5fn8UAVcZXn3ABE/n7CjFMPpL1eV93kPnH
         /w4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/PeU2gEC3LoYHxgoHpBg+aDS+BEleaPfi9f+JiK36Js=;
        fh=bK3L3R18KUJHFqWrNHN6kNrgUh1U23MXiYIpfwVO6fs=;
        b=a+Pehqy0Htxw6wblz1dHAt8to2aYILzGY67NmtQaXVWCx20zj6cVgeM2YJJZk99ddE
         rFoa9J1c3Fh5ZzNlXyMn2mxiLgcir1OH1bsNyBv5XJcgJSeM1iSszO0PSQ6WFHuNL0yN
         6KPmQRba4pC1e0ilh69+WDBN+snNxQkITmbi2aE4s/UOG1hPwIz61rLsHdJPggpYVhFD
         CUEk6x1n1rf8TZOp+fRaVwkZwu/XQ/yDT6HDAtiGPebNJ6Qh/yiepBvlOU3jw7lBISfe
         n9NQgUCHjrhUoo8MwZnDG21WxoytvnnMrwF84k9sx5AtxkLYpiTCax1bwt+bPsAHNB6q
         MjUA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790175830; x=1790780630; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/PeU2gEC3LoYHxgoHpBg+aDS+BEleaPfi9f+JiK36Js=;
        b=T0kXkBW1QGbMLeA8/5q90J9qkYXrqIBZh2ro9kUuAZ9ZnAAC4y+JwzufvFN0uh77KQ
         +6UO12B6hL4ohW+MnKfbkQ8qxsaZpZ3TVGvbsgXGMyFrkdCRl+NODtJcPwJWEOzLvRNO
         xUQDvHQZtUtLiodQvO31Zr5zTc4/sipSJ3P8yMZBSMvGcgP8Nk3dXt30STonM2XbULnG
         Vas9IZ0kQFUHG2nG+zdsPcLHZPIYzQ0wmS1VLEoyO82/CsaWbHEr1T83VbvVFTHItxjt
         H+4SEY+j66xUnSJe9uIrnLZ5gDPRbBYmGtq4xiPfxsoOqLgvfhwdL7iw0NsHcmQKebrS
         F/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175830; x=1790780630;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PeU2gEC3LoYHxgoHpBg+aDS+BEleaPfi9f+JiK36Js=;
        b=eIL3qKk2Tp3FKWGiTSB0kMe6HDQKLmdKSYVgl8ZXoSRl6W+409/J+VNE0KbPtfiZT/
         +hi9NPqAu7OKvIoKze5Vuxx9xLDdSZBo9J2hRkNdyGbC0lSZ2KAt31KcfXGG3gjt8qfj
         it+9scqU6l300csk9/qO+CoCUe1TcCmqNEXPVsmvvhNaOF3LMOu/JxoySmtvEEnwC3Tt
         5DmOYWOGsSY2v7Labk0W4E/BLWKsRf0EoCmmXCJYvmV/TAYd0Z2oCJKIqD5I9tJyxssM
         D03LB6aDx49gVwbOj2SaDixscyqFFVRobjE1RPbKGf/k+SVQNK1sWoj0WI2xOQdukjE6
         WbJQ==
X-Forwarded-Encrypted: i=1; AKwUvBydky9WxMNWuEOOi6k8SSqvVrgfEuKClmIWWJrdNy+6LgKqdlxJq1NXofYQ3RReX4u2j7TKNYc=@lists.infradead.org
X-Gm-Message-State: AFuF++m7DdkFfN+k+xiMSDP/wN4Bu5+9Ppk1IZiRJDy85cHxxy6Oc8lV
	txf8Zh//T4JEEunuDCoePy6FLBhOj+kdYQUa0XIv3DPKQ6lzUIiZCyKMC6EDCyx5uHLo0vKcRJD
	feLWQDtIWkmq2UttMpq6cXKFujtHsC7VFHYxrU/+tjtCAQ1PztSaGkOJYp4Z0g4yy6WDX6gX0Mt
	tfNZjkX66ypgZX7JRLiKOX1Rgb441vMjmzdaEmQMQ=
X-Gm-Gg: AYBFou1zOv+gWR2I6BSAQ6Bfjr+OVryBkR2dEyiozHL5qh6hik9HvCnEFnd8VL0eb/X
	65z8896/zdxaEotLLbjgIjuS3QK9IaMITiTAZMKnNQEz0X5wzs1vHnYzluUdcgYcvf59xX1SwZw
	BeZ1rroI1v29L7pOqjozS4EqupY4qHzVONaPx67ABH64nULRTYFbPbonMbRA==
X-Received: by 2002:a05:6102:5488:b0:7a5:e455:182f with SMTP id ada2fe7eead31-7ac1cfb78f8mr2788543137.26.1790175830205;
        Wed, 23 Sep 2026 08:03:50 -0700 (PDT)
X-Received: by 2002:a05:6102:5488:b0:7a5:e455:182f with SMTP id
 ada2fe7eead31-7ac1cfb78f8mr2788466137.26.1790175829576; Wed, 23 Sep 2026
 08:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-2-27dd80d841a0@oss.qualcomm.com>
 <a16d507e-17f7-4074-8817-4b8da3a71c3b@oss.qualcomm.com> <8ed398ba-2ebe-488a-a213-8ca7ecbe861d@app.fastmail.com>
In-Reply-To: <8ed398ba-2ebe-488a-a213-8ca7ecbe861d@app.fastmail.com>
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:03:38 +0100
X-Gm-Features: AcwNN1Ug9EBugFkjb8PX3BJuksaN57IKAVy35yQBrKwT5dMg_Iz0UHaPN9Wobrw
Message-ID: <CANyhwx0hZJC6xXaSC2g4GFgUOp5n_KN4tdXksW+s8Mk_+7xEAA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] net: qrtr: Assign unique node id for MHI endpoints
To: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: P3CG4EcMGZTT4PPnVAuAkOGAAs4SBguB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfX8/8tca52eJWO
 sC1tyhBJpruKZK4C65gVmsuxppr9JYq8hyTppmJCgiOjMXrqGHBGXlIBpF/2vQMIpk36tRw1vd1
 UHWMpgK3XB5mgBMba/w/YeAEpkg5qQ4gHfIYxd9N30xj6xORswd65w4M1R5yr7AaxSaLoK+hTGc
 naqRW1LJT7mXVtM/b/KRtNa7V1rRM42o2W2s+mKPC5sf1xWuGw90QOVYEGCAXsjcqin6GEI7Og5
 xxFb2LTJYtMji4it6b6UKVACguWVbR6+wmEV7smUAD4tarH3AY8R0qO5YH3P1qDXvuTsUiUrujx
 NbSanodVLt1qfZXtBRsAajyTO4JrnTP7UTUJKTjuInxdReO0TRcYntoaqoWwzc8vVQ0wUSZwN5g
 xShlfgeYvVIPocy7s/UqEOzBrF/nYeh3jr6cwK8K09FrBEDckXY16DnevHvsoAXfZIQLiMpy3VZ
 6QVWkYYZvuDtrViVtlw==
X-Proofpoint-GUID: P3CG4EcMGZTT4PPnVAuAkOGAAs4SBguB
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab3ea57 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=astPFzNtX3-rckHXrNEA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfX9mMI7KWcXEVQ
 u50xoCN0AGwkUPr6oMi1VJUUPlVjiIIFBH3fkEtLil3Bd3XnYPgNmJkxhZsN1EL8D5ToGwOYJDV
 4/3sh2weLIn6feJsi+mgZCjs4WxruJM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_160355_708621_4637FEDC 
X-CRM114-Status: GOOD (  19.84  )
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

On Tue, Sep 22, 2026 at 6:24=E2=80=AFPM Juha-Matti Tilli
<juha-matti.tilli@iki.fi> wrote:
>
> On Tue, Sep 22, 2026, at 20:14, Youssef Samir wrote:
> > On 9/21/2026 12:23 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > > +
> > > +/* The offset is chosen carefully to not collide with the node ids a=
llocated by
> > > + * the remote nodes. All the remote nodes use node ids in range 0 to=
 0xffff.
> > This assumption does not hold up for QRTR V1 headers where the node ids=
 are 32bit.
> > QAIC devices use BHI_SERIALNUM as the node ID, and it is definitely lar=
ger than
> > 0xFFFF.> + */
>
> Does that mean we have to go back to my endpoint id patchset?  It's an
> option, but a quite complex one.
I'm not sure. Last time I tested the endpoint ID series was its v5 and it w=
as
functionally acceptable, and other than switching to sendmsg(2) instead of
send(2) and sendto(2), it did not require much changing on the user-space
side. But as you mentioned, it was/is complex compared to this one.
>
> However, what is the likelihood that serial number would clash with
> these host node id values? Maybe just adjusting the comment could be
> acceptable.
The chance of collision is slim, but still not impossible.
I think a solution would be to treat qrtr_host_node_id(idx) as the
preferred id, not
the one that will actually be assigned to the node. And before
assigning the nid,
we check it against the radix tree, and if it exists, we try to probe
the next available
id (so an IDA). This will also require exposing the nid to the user in
sysfs (i.e. /sys/bus/mhi/devices/mhix/mhix_IPCR/nid).

Thanks,
Youssef

