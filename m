Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6740CAC583
	for <ath12k@archiver.kernel.org>; Thu, 11 Sep 2025 05:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qq/HctOkyUOkFAafBmZFjIX54nLQJ64hgO5H0BUZjPQ=; b=i0zsIwY34UEzYujGiGgRpBGs5f
	X1jZamarEOeM3USXd4L2PyqNjd0dxFn0kQ2x2kikuqAGI7v1Q+NKNW4wf0CqvksKSHrMJuv6juaOw
	9AuaWAY569qTv4bp9Cy6Lqos7ByA4YFeYYvX0uLSAF7b5hHmNGLJllE28YbKpna/FBgKcFWdcJX3y
	RYXhTaBxQX+R4jtC7HToYmEzwuEM1txkVyk7GMH5t/gDNPfBxeIY6tfkNqIdvdnwAznSEDKeFiSVt
	6DDY6fCDlV5ZJYCQxRK88pEIO74tpB69Tq45iFSlyZo3NrHMb/DdmL4/RBdgPY9rMLen8IxZIsaEx
	j6vFHPxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwaKG-000000017QA-2fJ5;
	Thu, 11 Sep 2025 05:58:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwaKE-000000017OV-1Kph
	for ath12k@lists.infradead.org;
	Thu, 11 Sep 2025 05:58:31 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IVdg032171
	for <ath12k@lists.infradead.org>; Thu, 11 Sep 2025 05:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qq/HctOkyUOkFAafBmZFjIX54nLQJ64hgO5H0BUZjPQ=; b=Xh4Tvg/2Ud5/u6ei
	6eKv+r0GF/1jneCVsYJLL2cIsdU2ik8kS/Mfm1qeckzU+sOiS7jYndqMy8K08n0I
	xG+9w6jcuQ/wiPl0/IXdOP9kEWQ05+xm2cZdsI1dom49DrL5zTexjzyM1Wf6FJ1N
	3DPDem7HJksa+7249tAnCHS2wMYB8GCOz1t9FkAUEvn3FycQo6bfuCg380CE8O/U
	pVPERt+Orw4/3PQsnIpQZQRv8t3chz+uAKeEexsanT3A9H3M61Nas70ni+Lt71Nt
	eSnDD1TUl7pVcAs7kpJU7UlkNA1Q0UIU2RvCaSNbND/pLJTdIzrRsIOF65n11bFT
	1omwvg==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493cpb1yfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 11 Sep 2025 05:58:28 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-4143cef1ff2so10137535ab.3
        for <ath12k@lists.infradead.org>; Wed, 10 Sep 2025 22:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757570307; x=1758175107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qq/HctOkyUOkFAafBmZFjIX54nLQJ64hgO5H0BUZjPQ=;
        b=ug/rLaLuN/3c3848xzJNMEmxZc7was0huOf3mutYbvB4ccJQj+UIioGd7tBELJfPZE
         nqnzzBfFSEJ5V5pFafNdtlpwU/LiPRZ7Tvn4xMneqTM0t37rDuoxCV89ikRg8HlxhtW/
         SKBk7hPOGl0IslGk471La0EJmYPgfODwc30DBB+3KOtOQSAPMH6k0t0A6aCOor97/HDH
         Plf4+Dv5x5BuCLLLSBhCvnUqMYmI/gvwcDXPn+4+6uDGlk24o/aByQPDbR2ep/FK/zof
         NBpXbbGboxYx6dtysmMgH+eDrmGygd32rVwYuz6ex8xQq/7A6FVAdQuxmvmshgjmfifq
         Nthw==
X-Gm-Message-State: AOJu0Yy/WTnXshRjq0sc13DcKLeoogKdOsKkL5XURNfgBOy8Oc4Fjjjb
	5+F9mvVy4SS/vjr0AjkDAaKf5U63wS6Jalm6IJZ+XsXTFQxNpCwf+UJ4bZvMJC8kS/17TLO40Ub
	VGBnxnE7jiiUHGd4BnwFocTCTLPWL8P3+dP3cC13YtxwhZAerSFYohcT5dYau+rsUY6aHRMVyur
	FzoHpGxmiG6D/39VCy9ml9ryxfM7eRqGByJ4hIMJbTbXBbeo1sVw==
X-Gm-Gg: ASbGncuaQKId+zuERBkPU0DriyUtrCqoCbuk8hfmv+hRNrX5b3GJ1BoCbC+nEhZPcNb
	tIo5jp6u6iNrAmbMtluO/UdHIa6pM8ZQWUadZQoKKMJg0BvYudyocennzCXBqwlivWv+gnOdk0I
	xAz46oCD3w5DGIPYviM66jUMU=
X-Received: by 2002:a92:ca4c:0:b0:413:9e81:7a99 with SMTP id e9e14a558f8ab-4139e817c77mr107988145ab.1.1757570307081;
        Wed, 10 Sep 2025 22:58:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFczCMiaPGcLaaGSwl0zn2pNemKYMNI0vEgQHodmNKJGzZOmkQkWOu7UD6ciNI6tC2c6J3ssX89EMqf/yuNWcA=
X-Received: by 2002:a92:ca4c:0:b0:413:9e81:7a99 with SMTP id
 e9e14a558f8ab-4139e817c77mr107987935ab.1.1757570306636; Wed, 10 Sep 2025
 22:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com>
 <DBVM2YZDTS15.1WAPW69YQ5XOA@gmail.com> <CAD1Z1J+jXWng4ma9_BPJh4N8b7AhTvRKtJ=tg1dTyk8E3wqupA@mail.gmail.com>
 <DBW8K6K30OQS.U5Z6UMSMEY7B@gmail.com>
In-Reply-To: <DBW8K6K30OQS.U5Z6UMSMEY7B@gmail.com>
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 11:28:15 +0530
X-Gm-Features: Ac12FXzeVCChHUAuNbTNYiazcoDlO2m_Sswse5H9jZ5hVl4SXkePBNDy_FHt8UI
Message-ID: <CAD1Z1JJfXqhTTaM5bqjN2MFXfAfzvu2AZKqfVkRn_VKvPckxnQ@mail.gmail.com>
Subject: Re: [PATCH ath-current 0/7] wifi: ath12k: Fix Issues in REO RX Queue Updates
To: Nicolas Escande <nico.escande@gmail.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE1MCBTYWx0ZWRfX4C4avKc7vULX
 vO7+JnDfau0IqQFPIXDwDJ4lTRLwRezSK7syxcVHfmFYxPvlLRNQs6dOxkPG5t/JUR9qDtfIltg
 Oi78KNWNeADShkx42v3Q8WoVAcP32FqKJuxoUjAmxKJDT9kpn7hHit/W5mYT3Fmqs3/5aV6zU81
 SEWm6+nw/cQOC1XTmQdRiy75piOQ0x9rUz3d4uFiczJCQVu4VlnBH0kIP3jKqI8OVB3P7oArooc
 Ob/O+2B3KMNwuC4KyOhUV0ssmx84aLT8QDjAscYgM56IDOGc8DdwMy0ZZznIVxPo2TkN9X/WwW6
 FPwtKIp6BiLKyO+62cVet56v2O+xR/d0zhxwWMSzj+4m3KW466898vM8CGd+gfuhc/0oPMuaDsf
 wdKT7Iht
X-Proofpoint-ORIG-GUID: JxeK9Hu9orZGeZYL3gjzuVXgWEJpRYyN
X-Proofpoint-GUID: JxeK9Hu9orZGeZYL3gjzuVXgWEJpRYyN
X-Authority-Analysis: v=2.4 cv=P4k6hjAu c=1 sm=1 tr=0 ts=68c26504 cx=c_pps
 a=knIvlqb+BQeIC/0qDTJ88A==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=pGLkceISAAAA:8 a=NIO-Sh5Dw3l_QA16ft0A:9 a=QEXdDO2ut3YA:10
 a=8vIIu0IPYQVSORyX1RVL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_225830_480111_CAC2A087 
X-CRM114-Status: GOOD (  58.72  )
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

Hi Nicolas,

Sorry for the delayed reply.

I agree with your suggestion - it=E2=80=99s a good direction, but it will
require extensive testing since it impacts all REO commands, not just
the RX queue update.

Given that the retry mechanism is a critical fix, I=E2=80=99d prefer to
proceed with that series first. I=E2=80=99ll follow up with an incremental
version that implements handling of REO commands using a workqueue.

Thanks again for your input.

Best regards,
Nithy



On Thu, Aug 7, 2025 at 7:09=E2=80=AFPM Nicolas Escande <nico.escande@gmail.=
com> wrote:
>
> On Thu Aug 7, 2025 at 2:31 PM CEST, Nithyanantham Paramasivam wrote:
> > On Thu, Aug 7, 2025 at 1:32=E2=80=AFAM Nicolas Escande <nico.escande@gm=
ail.com> wrote:
> >>
> >> On Wed Aug 6, 2025 at 1:17 PM CEST, Nithyanantham Paramasivam wrote:
> >> > During stress test scenarios, when the REO command ring becomes full=
,
> >> > the RX queue update command issued during peer deletion fails due to
> >> > insufficient space. In response, the host performs a dma_unmap and
> >> > frees the associated memory. However, the hardware still retains a
> >> > reference to the same memory address. If the kernel later reallocate=
s
> >> > this address, unaware that the hardware is still using it, it can
> >> > lead to memory corruption-since the host might access or modify
> >> > memory that is still actively referenced by the hardware.
> >> >
> >> > Implement a retry mechanism for the HAL_REO_CMD_UPDATE_RX_QUEUE
> >> > command during TID deletion to prevent memory corruption. Introduce
> >> > a new list, reo_cmd_update_rx_queue_list, in the dp structure to
> >> > track pending RX queue updates. Protect this list with
> >> > reo_rxq_flush_lock, which also ensures synchronized access to
> >> > reo_cmd_cache_flush_list. Defer memory release until hardware
> >> > confirms the virtual address is no longer in use, avoiding immediate
> >> > deallocation on command failure. Release memory for pending RX queue
> >> > updates via ath12k_dp_rx_reo_cmd_list_cleanup() on system reset
> >> > if hardware confirmation is not received.
> >> >
> >> > Additionally, increase DP_REO_CMD_RING_SIZE to 256 to reduce the
> >> > likelihood of ring exhaustion. Use a 1KB cache flush command for
> >> > QoS TID descriptors to improve efficiency.
> >> >
> >>
> >> Hello,
> >>
> >> I'm not sure I fully understand so please correct where I'm wrong but =
from what
> >> I got looking at the code:
> >>   - you increase the ring size for reo cmd
> >>   - you enable releasing multiple tid buffer at once
> >>   - as soon as you allocate the tid you create an entry in the list fl=
agging it
> >>     as active
> >>   - when you need to clean up a tid
> >>     - you mark it as inactive in the list, then
> >>     - try to process the whole list by
> >>       - sending the reo command to release it
> >>       - if it succeed you release it and remove the entry from the lis=
t
> >>   - on core exit, you re process the list
> >>
> >> What is bothering me with this is that when a vdev which has multiple =
sta goes
> >> down, you will have a lot of those entries to push to the firmware at =
once:
> >>
> >>   - So increasing the ring size / being able to release multiple entri=
es at once
> >>     in one reo cmd may or may not be enough to handle the burst. It se=
ems
> >>     that increasing those is just band aids on the underlying problem =
but I
> >>     understand it's just to be on the safe side.
> >>   - If entries do not get send/accepted by the firmware, we will need =
to wait
> >>     for another station removal before retrying, which could be a wile=
.
> >>   - Or in the worst case (one vdev going down and needing to release t=
id of
> >>     all its stations) the more entries we have in the list the less li=
kely we
> >>     will be to be able to push the delete of all stations + the ones s=
till in
> >>     queue
> >>
> >> So, on station removal, why not make just things completely async. Pus=
h the tid
> >> deletes in a list and wake a workqueue that tries to push those to the=
 firmware.
> >> If the ring is full, retry periodically.
> >>
> >> Thanks
> >
> > Hi Nicolas,
> Hi
> >
> > Thanks for the detailed observations and suggestions.
> >
> > You're right in your understanding of the flow. To clarify further:
> >
> > When the host fails to obtain a buffer from the hardware to send a
> > command=E2=80=94due to the REO command ring being full
> > (ath12k_hal_reo_cmd_send returning -ENOBUFS)=E2=80=94we treat it as a c=
ommand
> > send failure and avoid deleting the corresponding entry immediately.
> >
> > This situation typically arises in the flow:
> >
> > ath12k_dp_rx_process_reo_cmd_update_rx_queue_list =E2=86=92
> > ath12k_dp_rx_tid_delete_handler =E2=86=92 returns -ENOBUFS
> >
> > Given the command ring size is 256, and each peer generally has 16
> > TIDs, each TID sends 2 commands (RXQ update and cache flush). So,
> > deleting one peer involves up to 32 commands. This means we can delete
> > up to 8 peers (8 =C3=97 32 =3D 256 commands) before hitting the ring li=
mit.
> >
> > From the 9th peer onward, we may encounter ring exhaustion. However,
> > we handle retries in the REO command callback
> > (ath12k_dp_rx_tid_del_func). If commands fail to send, they remain in
> > the pending list and can be retried via the success callback of
> > earlier commands.
> That was the part I did not get, I thought it was just another peer remov=
al that
> would cause the whole list of pending entries to be reprocessed and pushe=
d to
> the ring.
> >
> > Do we foresee any issue with this ?
> >
> Nope, it should work.
> > Regarding your suggestion to make the deletion process fully
> > asynchronous via a workqueue, that=E2=80=99s a valid point. Workqueue-b=
ased
> > handling is a good idea, but we need to account for potential delays
> > if the worker thread isn=E2=80=99t scheduled promptly. We also need to
> > consider timeout-based rescheduling, especially during command
> > failures, to ensure retries happen in a timely manner. We=E2=80=99ll ev=
aluate
> > this suggestion further and get back to you.
> >
> IMHO it feels like it would simplify the code to just push + wake to a wq=
 on
> delete, and reschedule if no space is available in the ring. The timing s=
hould
> not be such a big deal right ? The important part is to eventually push a=
ll reo
> commands to the firmware but it should not have impact on the rest of the
> operation if it reaches the firmware later that sooner right ?
>
> > Thanks again for the insightful feedback!
> Thanks for all the explanations
> >
> > Best Regards,
> > Nithy
>

