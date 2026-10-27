Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E00606A328
	for <ath12k@archiver.kernel.org>; Tue, 27 Oct 2026 09:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ddXyjrCk;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mPNXWxHb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XGLupLmn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0nW4GpdOqtVNSH1UuGVj5defGAz9RFA6ehJB/XAZ5+Y=; b=ddXyjrCk8u4JxC
	xPyVN21oqsM/2xTfF2G8QjL1+leE2EljvqMYaYT74UbVSH6lkgSiKi+8Bfm5jQl2qF7T/ymVDmbBl
	IfbwoHMhXh+ona8ewvEVPLnBt6JmuiNXs7gQw9ID1WRSdJNyhYvciMxdahFG5JVQNKKC3UBWd9cGL
	wkyxpwTeHkTFPxyw3YlRGO4mv/F/w7nPkZIGEfepik90YvGOBd1KhlugXNRDwZTuwdNl1OV/4no1o
	jaaZTS9mDMW33206pL2/AMJJVNgQq/eJs/1eeEj0gyja33sdZJrmquh0OUlt5Hxzhtjy6lWzdDpTu
	gAlC57kdJnOh0NF5OXug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdox-00000004DX3-0eHU;
	Tue, 27 Oct 2026 09:50:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdou-00000004DVY-2wxF
	for ath12k@lists.infradead.org;
	Tue, 27 Oct 2026 09:50:18 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8iBjR1660573
	for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 09:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0nW4GpdOqtVNSH1UuGVj5defGAz9RFA6ehJB/XAZ5+Y=; b=mPNXWxHbgmkl0h+z
	jcduYQAk03rWXIyjqqgiBL94lKFBEmBZSBLjLuht/TUsDzoCwGPPCd312b0ZcB6z
	0pqwTdM50pLrGL4OOEtpRyAkola/f/ce0snEH3BCz86EP1vHRMErK/yb5Y7mhaMc
	xzC3RHKmmXUfKFjerAgi1dntt0QnLhi0JffoXwFFitoJLP8J8tSRYm2sQypII11r
	It2rf7mRVFNZujQ8uJBfHY2TMKuBcOy4Xw+IrXCJKnDvNCGYuRPA9at31JxBI3so
	dhYzuWiFRE+TJLZG26h4JumFOaOb8V+85UQaGxAR7S2TtPNO+E9QbAHiAx/muQcj
	h25T3Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq688ep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 09:50:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35dca90dea9so352951eec.3
        for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 02:50:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793094614; cv=none;
        d=google.com; s=arc-20260327;
        b=PW8bqDlJO/xwijSUWfgRU1c6UzcYoh5ZJ0IEOEGIDe1U2RRqMWOkrkmI9wjenv2PuT
         Rgk+lsqquAv5LGfss9mWMIfqiZIj7s9CdYP1kTG4kUY3S+txy5YS7Q+G3c8SxfIr9gRR
         bfw6EoT6OFy3LAfwEyE0qSAZv945Q9vnw25LekMFvcLsY8KRsFSsT6GVJpiU0bYrZoUd
         yZ/heVTy83TDtnhVh0C5SJ4V3CZMqPDsBbk9A/dTuWcZZG/eUiNRx7iu9y/CWZ5AKT4k
         2z42Xi6EyLrvz4e9224yz5OSt7TRgNsP4rWpcwQo3uJN7a8YnaCNFtZgSeLX+VJ2DhSq
         9LhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0nW4GpdOqtVNSH1UuGVj5defGAz9RFA6ehJB/XAZ5+Y=;
        fh=x3jNum1zBQ6dCUGteDcdF7H8iKkgFQ9YiC9CA6MXU40=;
        b=hJE1wPEQvTy8TdH/6OnmuywvJOf6Hc0TQPN2yAukrCvD9s4FNojOeA1CnRfxGbuAzc
         YbMwC4fM8GzbsFIBValZVb5YJF4HnDBPLlJzIHnipvUOQd9JEERqMd6uHPO01UOGHxoe
         vU8LhkbDk5X+rPYWLTnEjhmN3NohfQUIetZfSWvzx5bGevVE5kRq+vQFoxFuXWdK+S2K
         QT/6y6CfU7VhuMEOvXKoSKNU/eOyjC45F6GuEooRj3pD9+Fas1XRN69MGI0NIx1rCg2Z
         xmA3eezI33tJbI0E2p3DtZDbb0oczfWVxx8+B3sdOEn/dYpAdZFf3cX0PZp+8709ilb+
         6DIQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793094614; x=1793699414; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0nW4GpdOqtVNSH1UuGVj5defGAz9RFA6ehJB/XAZ5+Y=;
        b=XGLupLmnDcTLLdG6Faqk0iNLTEoZ3O0k7YBOZtz7kPzWh6b2V7R/Ws4SlheZKia0Nl
         SeuRsmZQvNeikDtvnulj6zHSgtKA+eqM92nfwXjScBrx141zFb/yRJQfrvoX/xz5aqud
         7fxoDcpz8AhiCnrS6ymS67/V8GAziIVzDA7000PpI27YD8nuXYc7ngIlt2vEmsw4ktXF
         p5a+O66NGJ6B6LMGGtJhuyUzHyrgk/m7Z6eIUy8768IuuqWEyDfh6n9GIACWvIcTtckw
         d59gXJBma0PDfVtsyh3y+2Yr28LlCB1k64zukxQQAmgrILbKf/0xXdM9bXIbffOlnLD+
         +Lsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094614; x=1793699414;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0nW4GpdOqtVNSH1UuGVj5defGAz9RFA6ehJB/XAZ5+Y=;
        b=x6JRL/odFoYoa0N8bXAUxKAlxiRI12P5NzWd4h31bjrqFbC8FyRlYRjmrQvN4e5zG8
         98/lE13wHX3JRGUrIAXTZAVjmoPiOu0Mnc+bQqN1+kLYNnwOD/zH548m/XlYnE/MaB6V
         g1MffPW5YXaFyEgGeL7tPwi7F9yZkKc7tVNqBkQ8jVIOV7sesvP6sbuvEyOmT9FAiP+m
         h2TDLsxkanwCLYanW4XcfQh8aTc3wsJxe+Su7mEsRWqCRUpVa5yieZirxpLu6GYl3tQP
         c1AtO6ozmel4po3pn+pKC2DRA2PW5GjfJEPHjJmAgxp5NSy/mo1YFzQo2skuPYmK/Wgc
         lPWw==
X-Gm-Message-State: AFq9FYJYADrNZtthhTHTpjXUwJfyzg7+WQIm7eI43Q5m+nQkdgRVz+6M
	Y/YtD5JkcPRyY+TIZRfbpzLDyGKLyOl3nk7SZz3709DZ5MFW1fyIaQB8xv4aTQjYwwXDDUueATP
	leS4fySoyypuJKTjJWn5Qck8vg5d13zTXQVKvACBPDX+if25bV2za9C+wjhEypczxxH8ghVwaHF
	7vNv1m4sKmvlDST2kA7+8AKpJcPJBW7Ia6EeUkC9A=
X-Gm-Gg: AYBFou3S0KSCrS4EXhzTw3T1zDcXXG7gg2CX4qOouCaqmtl6XnecyjQfSsRPVeM1V9P
	ijkffXx4IQAUCSAJePlNduUnBlNFQNy7NyLgO2zfy7flqfiI6yo41WBgbyJUhKw61kP1uqMsafl
	N14TgIeVDJqyT4JrV45xpnIt7apEBKAVca0q9JzXLCQZ3srslseaTKC7QpkyD75Xqk6eZUxSjRL
	kFaxvOC+APAr8YAFbk=
X-Received: by 2002:a05:7301:a08:b0:35e:d21c:f33e with SMTP id 5a478bee46e88-369e84373bamr23365602eec.1.1793094613318;
        Tue, 27 Oct 2026 02:50:13 -0700 (PDT)
X-Received: by 2002:a05:7301:a08:b0:35e:d21c:f33e with SMTP id
 5a478bee46e88-369e84373bamr23365547eec.1.1793094612682; Tue, 27 Oct 2026
 02:50:12 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261025181955.2089498-1-dencity7@gmail.com>
In-Reply-To: <20261025181955.2089498-1-dencity7@gmail.com>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:20:00 +0530
X-Gm-Features: AclHuK_7kOtD5jQvDk3UaufyQmlwRV_UVM79_HqaTmW-CloxbfLvAvQ2pquvxqM
Message-ID: <CABkEBKZtaWkvxbhnOPBUjbh_iLx-Tyok0PskhduQk4O8qq=NVg@mail.gmail.com>
Subject: Re: [RFC PATCH v2] wifi: ath12k: service all RX rings in an interrupt group
To: John Macias <dencity7@gmail.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        Jeff Johnson <jjohnson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae073d6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=Ng-7FXKHubOAd_qVELIA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: KgK8D4pNENBtNlCDTGIUEshI-UJsDYje
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzOSBTYWx0ZWRfX7sNtSS5BDlsl
 8eTB8L/cPB2blyENeqwwZ8riNfLOoNfdl5QoxZBG8RBQ1lEf+DiH20aKQBcdOFJc8Nf8Qk6R0f7
 zf9D1bkmgK/yn2QhlO3gOvQCR0Pw+PY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzOSBTYWx0ZWRfX+HduU5B9/nEb
 fpkKKK2EfPfQ3BbrO+58d+WCg+KvxmjkwCcXuUU7A9rvg8iFFaCSxhCKMsAd7/e0KMUuABihxan
 igJoGJhf9aPN0aEX43CHNnmE7aFv6w8PtVrUzutURgE/cofKUEZcpsB1MBc+KVJUg/T1M37opUl
 /IM575oMnhbGPtTzlLWItMw3OTe/QGt849Wz0kJuUZVGHmVhi+eZPQaZ0U94IQjkirm7ZEL5YoO
 hv77hzkwcS1LSi2s4ywQd//v6jPBp7QxO+5auO46utW/ZROCXvJdv+qpH06ahiS68h2kTbpcFEd
 CPTqaFCuqFSaWk+zyUXEmNsjRrn/0Uc5G372n+d4xPCSWaHcdXi9GPDq/LjLghMJWwdV4b4BFoS
 p33qJ0zU1FAvlY1m9Bi4o9tSQAKtaMoj6bE9OckhUK0GCOFEDMzzVwE3gH4b/0diJdalYzHrCYA
 IKDdLteAUIFa9rWim1A==
X-Proofpoint-ORIG-GUID: KgK8D4pNENBtNlCDTGIUEshI-UJsDYje
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_025016_862999_D65B32F5 
X-CRM114-Status: GOOD (  37.21  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 11:50=E2=80=AFPM John Macias <dencity7@gmail.com> w=
rote:
>
> ath12k_wifi7_dp_service_srng() services only the highest REO destination
> ring selected by ring_mask->rx[grp_id]. If a group selects more than one
> ring, the other rings in that group are never reaped, and the flows
> hashed to them stall.
>
> Every in-tree ring mask selects one REO ring per group today, so this is
> latent upstream. It is hit by the QCN6432 ring mask from the vendor's
> downstream tree, which puts REO rings 2 and 3 in one group. On a
> GL-BE3600 using that mask, 7 of 16 single-flow TCP downloads stalled or
> failed, and ring 2 reaped no packets at all.
>

Does any current upstream ring-mask configuration trigger this issue,
or is it only present in downstream trees?

> Walking every ring with the full budget is not enough: under load the
> first ring can use the whole budget on every poll and starve the others.
> With that approach ring 2 reaped under 1% of ring 3's packets, and the
> flows on it ran at 0.2-4.4 Mb/s while the others ran at 100-360 Mb/s.
>
> Instead, give each ring in the group an equal share of the budget first,
> then hand any budget left over back to the rings in a second pass. A
> group with a single ring still gets the whole budget in one pass, so
> current hardware behaves as before.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
>
> Assisted-by: LLM
> Signed-off-by: John Macias <dencity7@gmail.com>
> ---
> Changes in v2:
> - Share the budget between the rings of a group. v1 walked the rings
>   with the full budget, which starved the lower ring under load (see
>   below).
> - Rebased on ath-next.
> - Added a Tested-on tag, full name in the sign-off and an Assisted-by
>   tag, as Jeff asked.
> - Link to v1: https://lore.kernel.org/ath12k/CA+KzPsr13czsH=3Dk_UWJqj48C4=
Vsb-diQ-tiCh7W4XW31E8WzHg@mail.gmail.com/
>
> This is still an RFC because I have no WCN hardware, so the WCN side is
> untested. Since every in-tree mask has one ring per group, the change
> should be a no-op there, but I would be grateful if someone with a
> WCN7850 could test it and reply with a Tested-on tag.
>
> Testing. Both radios ran OpenWrt (Linux 6.18, backports 7.2), and only
> the ath12k_wifi7 module was swapped between runs. Rebuilding the
> unmodified sources reproduced the installed modules byte for byte, so
> each test module differed only in this handler. The QCN9274 build also
> carries an unrelated local REO fix, as installed. The QCN6432 is a
> GL-BE3600 using the downstream QCN6432 support (not upstream yet), as a
> 5 GHz client of a GL-BE9300 with QCN9274. iperf3 over that link:
>
>                               before    v1           v2
>   16 single TCP flows done     9/16     16/16        16/16
>   slowest of 8 TCP streams     stall    0.2-4.4      70-83 Mb/s
>   ring 2 vs ring 3 packets     0 vs -   3k-8k vs     about equal
>                                         0.7M-1M
>   QCN9274 RX, 8 TCP streams    1012     1048         1034-1042 Mb/s
>   UDP loss, 8 x 50 Mb/s        -        <=3D 0.02%     0.00%
>
> No warnings or errors appeared in the kernel log on either side. The
> QCN9274 groups are single-ring, so that tag shows no regression rather
> than the fix itself. The hardware runs used a variant that differs only
> in cosmetics (left-- was inside max(), and the comment sat inside the
> loop). The patch as sent builds without warnings with W=3D1 on x86_64.
>
> This work was assisted by an LLM (Claude), which helped analyse the
> handler, write the test scripts and draft this patch. I reviewed the
> change and the test results, and take responsibility for them.
>
>  drivers/net/wireless/ath/ath12k/wifi7/dp.c | 31 +++++++++++++++++-----
>  1 file changed, 24 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp.c b/drivers/net/wir=
eless/ath/ath12k/wifi7/dp.c
> index 397da016b..67a347362 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp.c
> @@ -27,6 +27,7 @@ static int ath12k_wifi7_dp_service_srng(struct ath12k_d=
p *dp,
>         int tot_work_done =3D 0;
>         enum dp_monitor_mode monitor_mode;
>         u8 ring_mask;
> +       int rx_rings, pass, quota;
>
>         if (dp->hw_params->ring_mask->tx[grp_id]) {
>                 i =3D fls(dp->hw_params->ring_mask->tx[grp_id]) - 1;
> @@ -50,13 +51,29 @@ static int ath12k_wifi7_dp_service_srng(struct ath12k=
_dp *dp,
>                         goto done;
>         }
>
> -       if (dp->hw_params->ring_mask->rx[grp_id]) {
> -               i =3D fls(dp->hw_params->ring_mask->rx[grp_id]) - 1;
> -               work_done =3D ath12k_wifi7_dp_rx_process(dp, i, napi, bud=
get);
> -               budget -=3D work_done;
> -               tot_work_done +=3D work_done;
> -               if (budget <=3D 0)
> -                       goto done;
> +       /* A group may select more than one REO ring. Give each ring an e=
qual
> +        * share of the budget first, so a busy ring cannot starve the ot=
hers,
> +        * then hand any budget left over back to the rings in a second p=
ass.
> +        */
> +       ring_mask =3D dp->hw_params->ring_mask->rx[grp_id];
> +       rx_rings =3D hweight8(ring_mask);
> +       for (pass =3D 0; ring_mask && pass < 2; pass++) {

whether two passes are always sufficient in all kind of scenarios?

> +               u8 mask =3D ring_mask;
> +               int left =3D rx_rings;
> +
> +               while (mask) {
> +                       i =3D fls(mask) - 1;
> +                       mask &=3D ~BIT(i);
> +                       quota =3D pass ? budget : max(budget / left, 1);
> +                       left--;
> +                       work_done =3D ath12k_wifi7_dp_rx_process(dp, i, n=
api, quota);

This will have the performance impact in case of srng->lock taking
multiple times in a single handling.

> +                       budget -=3D work_done;
> +                       tot_work_done +=3D work_done;
> +                       if (budget <=3D 0)
> +                               goto done;
> +               }
> +               if (rx_rings =3D=3D 1)
> +                       break;
>         }
>
>         if (dp->hw_params->ring_mask->rx_mon_status[grp_id]) {
>
> base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
> --
> 2.47.3
>
>

If current upstream configurations don't hit this issue, is this
change needed, or can we avoid the group ring-mask configuration
instead?

--=20
- Tamizh.

