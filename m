Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A507FC87FCF
	for <ath12k@archiver.kernel.org>; Thu,  7 Aug 2025 12:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Hzj89PdCGcQ2wYW8aWZx1cGKAdeJLsUTERFjJ58HFE=; b=mQLbUKOdFP25SS15mZ28E0Nc8Z
	3mX3Gu3e8BkUxhPIIA7uoNBLlxr6P/fh7eibhd8XY3bwv4u6hgB4OJQBoZBy67uqtyhCJ9m51RinC
	H9ZQqUQ/vW21BvArp20uLuTRkpSb6AQhjaGgv8xl0wfMAgz+NddM8etdgYUblJME3rJlR91uNQiMQ
	F74gqp2CrYpBHLtc7jeNAf8mHCsA6b9cca7CQ7xJ/8lljMApYhnvtyuaZ2sGBuBkCdBDXAnFEgcaJ
	r4ro5QJls07SeHXJ2lOqtZLGjEBNWVpgYmEqVxi3ldqYjr57HdaViUqBPFCwo+0466dAJIL2t1XZE
	L5voLwgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujzx7-00000000a0K-1TRF;
	Thu, 07 Aug 2025 12:42:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujzmM-00000000YC7-29LT
	for ath12k@lists.infradead.org;
	Thu, 07 Aug 2025 12:31:31 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779Cv9l003594
	for <ath12k@lists.infradead.org>; Thu, 7 Aug 2025 12:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Hzj89PdCGcQ2wYW8aWZx1cGKAdeJLsUTERFjJ58HFE=; b=KKb+e7L8Cb0PRsOS
	piH2sBvAB8hRhWnjREO2lVB90TEPV7deEjyUF0YZO3IJxYQ9TzvznlfOavuwQMFp
	nrWTLKNhMTMwiu9Gg76z3/AVdvOQkOwAAscXc4OH8OPXULcP+xpabyupb0uRSIu1
	bGgebQTrGq4j200oPI+nWkdbca7xeixZCV2MU+BxyG+DNm9qwSolrzkJdRc3teDI
	K3ZJM4fxkjey22KQJi/IlqtntljY/GLG1Hyp2+JxQNXMeczsxi/K85HSvaSOxMq0
	7ZRT5AShb5Ez5BSKRIpBuLWkodaLy2CNnAFngyi+/V3EMq0anb6U29cAM6xT3/7j
	RIgD4Q==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyae7r0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 07 Aug 2025 12:31:29 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3e51497be0fso9762475ab.0
        for <ath12k@lists.infradead.org>; Thu, 07 Aug 2025 05:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754569888; x=1755174688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Hzj89PdCGcQ2wYW8aWZx1cGKAdeJLsUTERFjJ58HFE=;
        b=Dh3MS+4oD89bqV7cqQ0+6lMEICfECJsKLGH8fLttf0Y+FedcQ5jJLG1C0+lkE5YHFS
         siPC2Mm35RfTmF+/AOK+ozA4ndBroJGRwLER/mOlUT7KLzkf2BhRLTdtPBLfRNDv4iKR
         vsIQr0CSWShujVMpMcgkvusgyCO4rcLK5S7MOmJmt88qX0PFXxlbV9x9+CLCVKIOb+9m
         PfvXNQ/fOVJm1vS72Tp8/fppdT5bQQ3aLP+DhhSf1VYXRZh9Ak26eW+1OdTujGTtgM4q
         fy1XWehCz4ixAIxGVtI+/tlwjZo0JBccnpltotn2nxwA+mqvvegqv4vs0GX4pLWAkqzy
         i3OQ==
X-Gm-Message-State: AOJu0Yy9OfQoFH8xSekoB/qT0V2uMgkZNLsjQ6Z1EqNAZ7Lf8HtQt3Tn
	C+fNhZU64DiDfh4p+1JNvU5OqlcWISjTM0hVTqtFhmMOyApka2QULnGD5lhM74znf87yAaRAQJo
	Qk07yzCO5Dabb2pijDnZiGiDs2jbjFQp3aLVWtBZJB60z5acePCgwhO6r7u2m1EaNSUxXjW6y5S
	ZgPMPCmmXSA7TAyo6EQPooYijfshYFT38r53Oqnzs=
X-Gm-Gg: ASbGncu6fSNt96rgFkUXyf28xDyLsKUu8839qln0FGb5LrpWQJgGuIz2XMv5xUuD3R/
	/2rgc4d4eIT3+N3jqbweZoHrGf4f4U+1VNkIW0cliPXkJWJPIeESoLXiqK+tZs27zKO5vh5M/Vm
	uoJhBTovn9gJGm4IyfZY9jog==
X-Received: by 2002:a05:6e02:2404:b0:3e3:e78e:4dfd with SMTP id e9e14a558f8ab-3e51b88ab9cmr104910865ab.4.1754569888224;
        Thu, 07 Aug 2025 05:31:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGMeg2RbCRlLoxf95o8RhoJYbqKFVf1VIyCayu9nBMd4pCGtxYa5ziSlxaKAz/GRJ50on9FwpajCExPjQ2H0E=
X-Received: by 2002:a05:6e02:2404:b0:3e3:e78e:4dfd with SMTP id
 e9e14a558f8ab-3e51b88ab9cmr104910435ab.4.1754569887749; Thu, 07 Aug 2025
 05:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com>
 <DBVM2YZDTS15.1WAPW69YQ5XOA@gmail.com>
In-Reply-To: <DBVM2YZDTS15.1WAPW69YQ5XOA@gmail.com>
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 18:01:16 +0530
X-Gm-Features: Ac12FXz3aDMv-msx9dizo560OwJfZvCBsrsu7JYp0aSZyUQh3pu-jcKaiLSQY8Y
Message-ID: <CAD1Z1J+jXWng4ma9_BPJh4N8b7AhTvRKtJ=tg1dTyk8E3wqupA@mail.gmail.com>
Subject: Re: [PATCH ath-current 0/7] wifi: ath12k: Fix Issues in REO RX Queue Updates
To: Nicolas Escande <nico.escande@gmail.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: mc0sLerf2zsJpjpdHUNPbIbYLXdl2yX_
X-Authority-Analysis: v=2.4 cv=MrlS63ae c=1 sm=1 tr=0 ts=68949ca1 cx=c_pps
 a=knIvlqb+BQeIC/0qDTJ88A==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=pGLkceISAAAA:8 a=DzQ5D1QIoQUFvDlUu2IA:9 a=QEXdDO2ut3YA:10
 a=8vIIu0IPYQVSORyX1RVL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX8O/QVpGxXc5T
 E9FQHtlbPRlhsX9q3FYZFYLVbvDjqRKJAQPQX+70N7l2HVVtUioe/r0OGp2hJe4aPtVUFhbO9MH
 5B/tm3oS1SncuTp+Fjm1pfgW3mz3uay+1pgGyMR2uk/WJOORowjxxF+cT5ojEFRFLqRHIgMBSSB
 eS7loYIBJiqtQg1YLnHcIvbobE41dCWZ6mIR6qTDXEPV5KlRpdCVwzUjf2rigxmoESVUxxhGpH/
 rNXwusjxvHllXqVtqHmY9M0AF2DqQ53kzn8PFdjFsAq8FLOec6obn+ctTA7xj58178fJx21ij2J
 U98jhbFN5sJDJQpqz3kxZUtVgHqm6WXxOWLY/5wTId4nq4CHgn4rdCPkuEyt5arFOBkYqmzYo4z
 PKMcxOqM
X-Proofpoint-GUID: mc0sLerf2zsJpjpdHUNPbIbYLXdl2yX_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_053130_559776_64A68D89 
X-CRM114-Status: GOOD (  40.48  )
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

On Thu, Aug 7, 2025 at 1:32=E2=80=AFAM Nicolas Escande <nico.escande@gmail.=
com> wrote:
>
> On Wed Aug 6, 2025 at 1:17 PM CEST, Nithyanantham Paramasivam wrote:
> > During stress test scenarios, when the REO command ring becomes full,
> > the RX queue update command issued during peer deletion fails due to
> > insufficient space. In response, the host performs a dma_unmap and
> > frees the associated memory. However, the hardware still retains a
> > reference to the same memory address. If the kernel later reallocates
> > this address, unaware that the hardware is still using it, it can
> > lead to memory corruption-since the host might access or modify
> > memory that is still actively referenced by the hardware.
> >
> > Implement a retry mechanism for the HAL_REO_CMD_UPDATE_RX_QUEUE
> > command during TID deletion to prevent memory corruption. Introduce
> > a new list, reo_cmd_update_rx_queue_list, in the dp structure to
> > track pending RX queue updates. Protect this list with
> > reo_rxq_flush_lock, which also ensures synchronized access to
> > reo_cmd_cache_flush_list. Defer memory release until hardware
> > confirms the virtual address is no longer in use, avoiding immediate
> > deallocation on command failure. Release memory for pending RX queue
> > updates via ath12k_dp_rx_reo_cmd_list_cleanup() on system reset
> > if hardware confirmation is not received.
> >
> > Additionally, increase DP_REO_CMD_RING_SIZE to 256 to reduce the
> > likelihood of ring exhaustion. Use a 1KB cache flush command for
> > QoS TID descriptors to improve efficiency.
> >
>
> Hello,
>
> I'm not sure I fully understand so please correct where I'm wrong but fro=
m what
> I got looking at the code:
>   - you increase the ring size for reo cmd
>   - you enable releasing multiple tid buffer at once
>   - as soon as you allocate the tid you create an entry in the list flagg=
ing it
>     as active
>   - when you need to clean up a tid
>     - you mark it as inactive in the list, then
>     - try to process the whole list by
>       - sending the reo command to release it
>       - if it succeed you release it and remove the entry from the list
>   - on core exit, you re process the list
>
> What is bothering me with this is that when a vdev which has multiple sta=
 goes
> down, you will have a lot of those entries to push to the firmware at onc=
e:
>
>   - So increasing the ring size / being able to release multiple entries =
at once
>     in one reo cmd may or may not be enough to handle the burst. It seems
>     that increasing those is just band aids on the underlying problem but=
 I
>     understand it's just to be on the safe side.
>   - If entries do not get send/accepted by the firmware, we will need to =
wait
>     for another station removal before retrying, which could be a wile.
>   - Or in the worst case (one vdev going down and needing to release tid =
of
>     all its stations) the more entries we have in the list the less likel=
y we
>     will be to be able to push the delete of all stations + the ones stil=
l in
>     queue
>
> So, on station removal, why not make just things completely async. Push t=
he tid
> deletes in a list and wake a workqueue that tries to push those to the fi=
rmware.
> If the ring is full, retry periodically.
>
> Thanks

Hi Nicolas,

Thanks for the detailed observations and suggestions.

You're right in your understanding of the flow. To clarify further:

When the host fails to obtain a buffer from the hardware to send a
command=E2=80=94due to the REO command ring being full
(ath12k_hal_reo_cmd_send returning -ENOBUFS)=E2=80=94we treat it as a comma=
nd
send failure and avoid deleting the corresponding entry immediately.

This situation typically arises in the flow:

ath12k_dp_rx_process_reo_cmd_update_rx_queue_list =E2=86=92
ath12k_dp_rx_tid_delete_handler =E2=86=92 returns -ENOBUFS

Given the command ring size is 256, and each peer generally has 16
TIDs, each TID sends 2 commands (RXQ update and cache flush). So,
deleting one peer involves up to 32 commands. This means we can delete
up to 8 peers (8 =C3=97 32 =3D 256 commands) before hitting the ring limit.

From the 9th peer onward, we may encounter ring exhaustion. However,
we handle retries in the REO command callback
(ath12k_dp_rx_tid_del_func). If commands fail to send, they remain in
the pending list and can be retried via the success callback of
earlier commands.

Do we foresee any issue with this ?

Regarding your suggestion to make the deletion process fully
asynchronous via a workqueue, that=E2=80=99s a valid point. Workqueue-based
handling is a good idea, but we need to account for potential delays
if the worker thread isn=E2=80=99t scheduled promptly. We also need to
consider timeout-based rescheduling, especially during command
failures, to ensure retries happen in a timely manner. We=E2=80=99ll evalua=
te
this suggestion further and get back to you.

Thanks again for the insightful feedback!

Best Regards,
Nithy

