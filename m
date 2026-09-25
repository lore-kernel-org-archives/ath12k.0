Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25431C9830E
	for <ath12k@archiver.kernel.org>; Fri, 25 Sep 2026 12:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MPY/wBT5j35ozhTUGWxFnPpk8kim/mWPV8B3d7VqlCg=; b=20l8ICaVgdJEXAZ0O+hrnCNncz
	eI+f9tRYfAnu9EOv3ULy38QCVZLgA7XNsn3+dLaK3Cm9AYIvKlD2RWzPOLB0csc0iXP33DTPrCVmc
	oKXFVl7EmvqVDDsncHIJVkzqFU89CqP9+mv6ZD/rHoS/HHJvWMcMbn99ofINP+f2DeNmhd3Ujknp7
	VmICoK6w6AhwVJhu0t2CFSHeqS/OIFfT0BdLO+zJiR49a2iyc0FYcU598fw5Xqk5HIxjYnokpN5Lj
	YkQAQ17RLHC4PPi/kgSp/H9g4w0SYOzGqdW3l5MquZ5FApvNIPNtsb99vH6BsAbfF2ikCHmlXi3k8
	DDYRqjZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5KE-0000000DLgH-2DaI;
	Fri, 25 Sep 2026 12:46:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5KB-0000000DLfV-3OVe
	for ath12k@lists.infradead.org;
	Fri, 25 Sep 2026 12:46:49 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5JDfX3627522
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 12:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MPY/wBT5j35ozhTUGWxFnPpk8kim/mWPV8B3d7VqlCg=; b=AYRND37lW8jWqGFV
	EMTeyG+FZKnEy5vL3U+fYits/0aiDIdPkPQkN9x0BSY8KieqAxlqH+FKJz/ovMl1
	pi+PW955ABRDkDegByWGk5OQwdAm7J0lyDupnHk8r2q6Q0wEuetM6EPfDud8Vtg+
	lnvBgp+TZAEux1kE5J6RJ4GYEhE1WxoVknRktqa87lERES3NKZD6FEymRfNyrxut
	jiw+M63dUTkdK4yjXpqbpbg4dQUpBIYjYUrKRKHKzh4LnutRe03FEDwTlzS0ndoL
	1oaAr5u1jyp3H20NIW452jfWhlhC6tML+hYaMhSg8EPIGEdrRxJVTetuiJfXsDWt
	JYPOhQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq39c46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 12:46:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91431adf55eso12103236d6.0
        for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 05:46:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790340406; cv=none;
        d=google.com; s=arc-20260327;
        b=fV/YIwif7Wo6Hnfvx937tj6vxg3FX7Ro782JHLnz9sZT5ipi3bm7ViH24nn+46AEXN
         VttwNvl/Z11jdG14AmEvl+ApIh6Bc2dYKjepzMY/EnHiFZ7Y/EDcENVLeNnyAFmYW4Vl
         HjLqQE9DbTn45k6fk0RF42Rw/fHjN80XLHFoCQA2j5bYq5bGNOO4YZxVWOzW4FaUHJYz
         ++yqaAZxJXr1i6g9o+z9rf6N7T10J7hTbpkKCWMh8t1nrkBfpjbvzDuLAN9NOXJAfwct
         baFXahhSDNPeDCgAA+lLW3ppWgjKLyMzDbqLh/2JXi2G0Rq/+6aJJJJgVBwHezDwNxrg
         9piA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MPY/wBT5j35ozhTUGWxFnPpk8kim/mWPV8B3d7VqlCg=;
        fh=yME2YR1AX1FtYi1sG13fHskoCp0gyvnKx3DyTu6s78I=;
        b=pf65tEy3rXNLYoKfk0bp6NcVbSsHJjJhfg6KTrbNOw5rEGphkNqR4JVvHS9E1qOw5c
         Kw1t4+0c2GDTUrBEUxhg5mtH0b6FGdbql3uRAB+klqfprpYuSDdEuS6tUY6JSGKClvKd
         Gp+zekKYYwKzuBi87nsnjwHPvp6WmRFC/FyJ26IGtwSMEu/1wdSj82BEuqwDOmlu0LHD
         6kh1mn1+mKE5zqT1tXlPFWtBuPO8ZTaQJx9F3dRTIj2+L+5EiYm6FZdXSw8PTPUHuVAY
         TYmhM7MgXD/OFNi6EMZmA8YPZ9C69hbwoR+I1O1E7MD/4DFD/vK2J2UL16eJHJZNFnSS
         AO2A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790340406; x=1790945206; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MPY/wBT5j35ozhTUGWxFnPpk8kim/mWPV8B3d7VqlCg=;
        b=A+gD0Xg2x4da8ObClB8yxCmE+JFJcEOdHcC9A0JcmdB8rn1TUEZxSTB+CD6dGetJIh
         jmlYIq3FBXPPfo9cpKWcwDPntBMGmVzQPiKTVfmpr5PlIXmtBIm7UUlPrnhNchq0BeBr
         Jgv18oUxrwrZBQfU8lhE+bsPnn7jSlYLrixLncbxjNVmyEqhfSs6v7LQdCXmaAwpG83X
         xiK7bEAusR0UEIgGS4uuH3ZYTqKmXIVEmj08MhY/WXWEjuSbuKdjV3KabyLth9xpEyIS
         B+vt+wa+q8EZpsQRPJ4ZpUvJxdZt3Gg/oef3vgPTl0/1n02JFJjq1XuQoISMS1TuFqA2
         c/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340406; x=1790945206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MPY/wBT5j35ozhTUGWxFnPpk8kim/mWPV8B3d7VqlCg=;
        b=V6p6YmHvjA11SX/vb1gVS3lTofUOphCeCuVR68pbXIQoVDWEq8gQMsyXBKmgIrQjj3
         jm/1T3x+/q1H5vsZKW1pDegKl9XF1QmlXfYPXOCfHLkRK6wcdvfsQPYWVFnpfM3xpgEi
         R5S/YNu9K7D/wpWKRGNrQFm5yo1hzy/3YCIS+XYbvvKxEnJ2K42FR56Sa1vyklbe74ee
         0GQ4cKmYe+IEyAWJVL2gu3IohBzRXnb1aLn2r0+jzT9RULI1XD9+1qZebHv3NOSSkFAR
         xe2fzfFJfTELgnnx9oL0bD8n31Bdj5g7TiclPRsLcTDuiih44NJL/8mc1P9rH7gAxr8T
         XGAA==
X-Forwarded-Encrypted: i=1; AKwUvBwpb203UNhV3RuZRvb6O6hJB4TAd2kEhMhYuph/UxCD77fJgZlYHwzkaeGpGoG/uyLJQwmuxvQ=@lists.infradead.org
X-Gm-Message-State: AFuF++mHShThShUHlrG/YSxDQSGrjSEjS43e/74aHyRnpx55FDymEzhf
	JdLUdfSIuC6+OAA8NlLMOYfs2dS1IxtzNR4RJg6kTZkGaNZxnDNEbHKrO/7NMnJWx+1jySazJYS
	KETywkbkYCky73lrUqIHCy24XzMvX8ZSGcfW2zL/JBACaAP/yU5I+b1yXPbzSP1vjhGw9yzdBhH
	fiY1Ojq+Rkyy3J664xZFN8KGBef1eA+Owcbguw+Ug=
X-Gm-Gg: AYBFou2ybM9cWSPHmg0TEB4EJbk5flrn9Q8EI4bJHGMstWR4C6a2ItgJyk0BTgn9uBY
	s+2YPXZCb5kXO1hDIs1hnAXWigi8K18ETU3UhwPr4uAJUFwIxy2hlflXslxzeelZlcRCfx0juwb
	B6Sqe84H5sZlNVAPLbIawYHK7JtomF/eL3a0bkzJTQUOwLPePg68R6HBkdWQ==
X-Received: by 2002:a05:6214:2462:b0:90e:9408:2fc5 with SMTP id 6a1803df08f44-9142f63ee23mr38807736d6.5.1790340405822;
        Fri, 25 Sep 2026 05:46:45 -0700 (PDT)
X-Received: by 2002:a05:6214:2462:b0:90e:9408:2fc5 with SMTP id
 6a1803df08f44-9142f63ee23mr38807116d6.5.1790340405276; Fri, 25 Sep 2026
 05:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-2-27dd80d841a0@oss.qualcomm.com>
 <a16d507e-17f7-4074-8817-4b8da3a71c3b@oss.qualcomm.com> <8ed398ba-2ebe-488a-a213-8ca7ecbe861d@app.fastmail.com>
 <CANyhwx0hZJC6xXaSC2g4GFgUOp5n_KN4tdXksW+s8Mk_+7xEAA@mail.gmail.com> <ayyrvpxnxonroz6kafehepplhltnzgopgt6pn5fnpdmft6rbxm@a5sps2dnso47>
In-Reply-To: <ayyrvpxnxonroz6kafehepplhltnzgopgt6pn5fnpdmft6rbxm@a5sps2dnso47>
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 13:46:34 +0100
X-Gm-Features: AclHuK9M9IbbCEpkXjmHN3eWA-5m3q_sE1ucHvnsGGxug-EHSGOK9v70zRPAC84
Message-ID: <CANyhwx1EG=2FyBm150wrKpj=kQ1066iwZWndx=ZL3BKNoZUhVA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] net: qrtr: Assign unique node id for MHI endpoints
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MCBTYWx0ZWRfXwU+gkBZ6Qa07
 418LvEu2F1+DCNCHFM9CSvg8O1jdEIO/B5uPT4i2tiUBCadEzwH3awW3Ywjxa7bX6Qd1U6wQ1iM
 CQsZwYklxKA2RdBP6NfYxO2A61yaMXI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MCBTYWx0ZWRfX51raVfOM98b4
 R05Oypnj6OX2D62jnh/Sb7uBj26zewcwcRw+ocKfGMB7e7/6X4uPO/BCnVXoP/6MRChSGaw7vBJ
 jWDMDZz98Rj1EoiIYVOz3ArmgFgrScU6t78uWlgRQ/XDEgkIppMJdF3IdyW1RVKIJ8/sfBl4buB
 C6+H9pjzhw/tVtPSmdxu5pwhgCTnn5A1vGHArAk+QTXE4FJCroOgJR2UW7oDAMFuC3zrljfZlAn
 bK+iZRKEQV9AKfUqvcuYE2gnChBKs3Htxqym0u9ZaV+XSio2f9xpgPMoa9t1A5a4Gn1qaYr5Lhh
 8+rx5/gUIrRRQr82rqfsygF8T4PxZqmyAHeg+mmcFfk4sNZP8eAmOnTAdzz3PDhwvbsUbA92nwj
 7L44PSTk/iBC1Z51D/PeiGMIU3AHtlN0inzANh7CldggDwtt3sIDeywbtNmYcZ+xbuLSeQ3G5X+
 vSF54XvA3L9GffD7BzA==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab66d36 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=nOLRoRm-sisVCJmKiMYA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: PIPJoy4UiXSDT4YZY10shz-NPxnXcxIy
X-Proofpoint-ORIG-GUID: PIPJoy4UiXSDT4YZY10shz-NPxnXcxIy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_054647_958850_C7DB2C0D 
X-CRM114-Status: GOOD (  17.23  )
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

On Thu, Sep 24, 2026 at 4:58=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Wed, Sep 23, 2026 at 04:03:38PM +0100, Youssef Samir wrote:
> > On Tue, Sep 22, 2026 at 6:24=E2=80=AFPM Juha-Matti Tilli
> > <juha-matti.tilli@iki.fi> wrote:
> > >
> > > On Tue, Sep 22, 2026, at 20:14, Youssef Samir wrote:
> > > > On 9/21/2026 12:23 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > > > > +
> > The chance of collision is slim, but still not impossible.
>
> When you mean collision, do you mean node id collision due to bridged nod=
es?
> Because, even if the directly connected QAIC devices use 32bit node ids, =
the
> collision won't affect the functionality.
As in ep_nid of one device matching the nid of another device. In MHI,
that shouldn't
really matter since this patch moves away from using QRTR_EP_NID_AUTO in no=
de
assignment, but as you mentioned below, it could clash with TUN and SMD EPs=
 that
are already registered with their ep_nid.
>
> Also, there is a collision with SMD and TUN endpoints, but that's out of =
scope
> for this series.
I have not worked on a system that simultaneously uses different types of E=
Ps;
only MHI EPs. But if there is a real case of that, we can move to
global ID assignment
that includes SMD and TUN.

Thanks,
Youssef

