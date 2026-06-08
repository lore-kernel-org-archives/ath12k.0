Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C94CD8C8E
	for <ath12k@archiver.kernel.org>; Mon,  8 Jun 2026 06:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KtG0uM4rhmMQQvtWIMaA5CSqnNNs3fvKYxH3bxEulUM=; b=fPPOJpvCH3vwFLRfR01RYQD60C
	J9NIL6PbQNnVtTI3c6wrufxu5K7pjDhoypjF9FXAEflZ1pBizYF8XP6eVm5nEuNITccDZo8xhEXtq
	kEg0gQl74QGbOuHJo/WxxERWR96fnjmvzvZ/2OCZcDFY5r8ob7NuA/qerFZOMZbCon31GpyW6cEr+
	tHEtpAKmXyQw2gxro7Q1YWaofTEOLA6GbyISeNoi0THlC85dJfBUfT62GCkE7CAuTSez+3Jyc/xT9
	LHmLULyXHdAG97xVO4vrSek4OXBF+GyY6xq4zXi6j6H7ckl8ykVRsOT2lkUxLVGpjiCRv1opsG66F
	HeLpdJCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWT5E-00000002s5G-30H7;
	Mon, 08 Jun 2026 06:03:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWT5C-00000002s4o-15K0
	for ath12k@lists.infradead.org;
	Mon, 08 Jun 2026 06:03:35 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580F26e1471407
	for <ath12k@lists.infradead.org>; Mon, 8 Jun 2026 06:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KtG0uM4rhmMQQvtWIMaA5CSqnNNs3fvKYxH3bxEulUM=; b=nkvza9R+kdit11yt
	XmpG79L33/DwCp6WVp7nOT4bBggMgSy8RR3ghno3bBGUNJytxNMgDawIPaliLKIu
	lsnpx0C6GlFWI/2QAPErZpz7Da6jpTJo5KZOUrvtE0bQ7wDf+msxXRE+xuEkhyOD
	3YdIJgtDuBN9u+3f+qonR9R2OjY9joXveSfdYKNwjV4qBkWj8ANlI/9qGOEQkdPt
	kgRdO01aoNhu1VD0zmFpdK+2ns8g2WPrlrNE88GkO/gzC3YUJUKhIFlmKJH4iYwc
	CzCZIN+kgz2mTSpjhpBqWoXNJwvC1xDtjRohLat91vjBERMon3kqISIG1srAfAZ2
	8nxHzQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgww3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 08 Jun 2026 06:03:33 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-137f2f50cbcso383852c88.0
        for <ath12k@lists.infradead.org>; Sun, 07 Jun 2026 23:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780898612; cv=none;
        d=google.com; s=arc-20240605;
        b=Hb8W6PHCwEZzrBmQCLXvMZNooJkGX1XsjmiNr/L7vomI8fPW3iifteSnGtYstGWKVg
         UnXE1zCRzz+vSPQL2OV/liJp4EWWa/U07JEf6slpsoTTXhwILkd93Uuh7PFBLosRZWwe
         8AK8Kg4OH/AFoZCnq5bs6IkIZBoBnONZ7r3oL8xwqLCX1Q+pJfGOhJjI9GSP5WWhN45N
         jbO51pJyomIA+XojYzc/0j5KgENugbPwYvORa4xnVJgO4Y1QCCqI2AA9Jhr7T10trXzZ
         4vpmlO9qmxIVdGlkdwMkNp7mLr0/qx5hwZucvfquA35LlyNbUZD6Lw9DXx08QgrMHJfg
         Ve0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KtG0uM4rhmMQQvtWIMaA5CSqnNNs3fvKYxH3bxEulUM=;
        fh=Wj1P1aJ8t69RK5hEeJLKCQtUFKICWjNl8avssWlh1dQ=;
        b=Dz8F/UmbIVBu9tbCWmRQHHq96Sd4eA4DD52mtzhEqLR/m68NSWPMWc/XXe9JdE6BDu
         leAX45BhBUqv/XPJohx6+Wep8FLoot0/YuSDOVG1qrDTDDpyMK1WJlttMshUSrIcux4Y
         etFFgnx3has1IUg9aQiaPH973pSTrTNSTTyHN/aYHFeP8psAtG70JJWommcuooheu80o
         Df3Wb8/BTVmC/bvkXddkcqd9yoXcb+XDQQrPBVU7hHvmWLeft9EUwjm1/N9btH2CRWZ8
         4CX6gCipL74tnrP2V3+ENU3D7y+y7ltx8MLzd/jPXGDaP5GTjKJRFkvwHiyl8b9cC0Z+
         6/zg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780898612; x=1781503412; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtG0uM4rhmMQQvtWIMaA5CSqnNNs3fvKYxH3bxEulUM=;
        b=VppjS1JGtjm3zoOxY9jQB7vLMKPWc/DhWO/WI52XGu55MIvPslTnShb+ZX9P9mlA2c
         8Nhllxw1BrbvkAhtg67hTsGa46/LqvCQeV0oEtKar1U0MmXTE2dQoiAtdm1FFc3kZ/H4
         iixjxShP7Prm3c1hxCjOCHJT7Qf3Wj4oLmn4YWjf37+ruhG/J4+FThvg4jnGa6WKWfeU
         bOczPr6hYgmNShPAXIsM56SxepIM6WIEKQGbkdEnxpjcUe9jfBwxqlE8KKUmaQGcNVRh
         vVR3ZrqjMCzuEgD9wrEl+8WG9gd6Fd6ieFeO8G4u/kuMYWdspBqTBHS2mCdLxZp/PRQO
         cGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780898612; x=1781503412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KtG0uM4rhmMQQvtWIMaA5CSqnNNs3fvKYxH3bxEulUM=;
        b=cHxsXt5bIOOCPp2V/VxyEGKl1TAkIZE3wxnaBChCDgNUydchXEFqN4JNpn2OF/+c4o
         fG8HMDbLrHpe7Iq99TA/O23BIHLTYTvb5mYtcTi11norWVBcxq4h0f4C6Nva1Vt+wXBp
         tBMzew4TDNGZP9jMYPbucdQJz7xMGfA4Si/O2s3kGK7qSeknwPg/ilF5M4x7S29E9tZs
         wl9K24Zr2gL2u6naah79F+CgakP3G47da+waPfTDDPUSuMnopX+/deYg3wK9X8MZzN4D
         nI2rOjx1PdcbAzItUUBwLAW9qOY83w3mqTG05v6r+ES8vng2yZbaePCklfcNNVtzG47q
         5YFg==
X-Gm-Message-State: AOJu0Yyq6CG76hjQE9m7rhgnADd3MPFOb4/0yr2s3vRMG9At1/y7gDHK
	n4I5l8UJEyF45kQobORh8vN2bbARyMneRui98tFf4drWj5fpA3cM1diwnas1WfrolZsljpIryBq
	n3Vtmb03rXuC3GpdRGt8TPJAYlZ+whwTSXU9MKzEdEKVdMJD4RKW2Y4RZAo2O3peFuSWOKEhXvf
	xR5vfKH5yQdrC4sJJaWMDHmplnXQqfVZE1LnCeigo=
X-Gm-Gg: Acq92OHE1zGqVjgRUnxNhq6qzaBf/f2xL2McMdK6XvnnS1A0PZ9B0GLFSzW0t8Lnv32
	ojgrIUpIQGlNFFMc127WGSX45QTN/iYsMBYr587aoy+0lR7zE9yQc5Rx4w5VDBGbf9zLPe5myOk
	oH2THF3Ad0MeVAzv4SOQTyMq1lAeHDMz7Zm3H3dPsMp8pw7rHo5LZjFYTdDjYgoMqUaQddWpxmS
	d3KoBzzCH6c5GlBoIOPBI+pQ11sTIajqVjM3Yytxg3SV+HLRg==
X-Received: by 2002:a05:7300:1352:b0:304:c73b:79ea with SMTP id 5a478bee46e88-3077b576885mr3415742eec.3.1780898612331;
        Sun, 07 Jun 2026 23:03:32 -0700 (PDT)
X-Received: by 2002:a05:7300:1352:b0:304:c73b:79ea with SMTP id
 5a478bee46e88-3077b576885mr3415736eec.3.1780898611703; Sun, 07 Jun 2026
 23:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260525110942.2890212-1-tamizh.raja@oss.qualcomm.com>
 <20260525110942.2890212-3-tamizh.raja@oss.qualcomm.com> <a97dac59-a689-4b9d-8419-2b09c1d106ab@oss.qualcomm.com>
In-Reply-To: <a97dac59-a689-4b9d-8419-2b09c1d106ab@oss.qualcomm.com>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:33:20 +0530
X-Gm-Features: AVVi8CfXKWhGPjRErM_0nisldWWQ8Rw5_l-GNipArjk0gJx82rbUzCAoqcHI7oY
Message-ID: <CABkEBKY=GEOkDLS1A+8=i1q0iN1WMrQ1N1AjAS7Ar0KOxj-mrg@mail.gmail.com>
Subject: Re: [PATCH ath-next 2/6] wifi: ath12k: Add support for 4-address mode
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a265b35 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=1qolghEAOrdbzapifhwA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: OZEuh-NkG9L-Kcw6m_poXYSLIGVdel99
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1MyBTYWx0ZWRfX0EVaa4fmw77V
 /Jc8N6yZfM+9BqRtwA4RsXIMDDkbV3isFqnOkKoD5YCQQ/vbR/OgHyCQA+XoMin/fI1OmvVYKDC
 wMTnPB2wVnxWzWqyMLofyeVXi+xi0zJZfzfk/dZayNd+xj0PF3tNtPECpRe7GEPm6Qp6GR/x0Wk
 joa7e7kr8r3ziI47KEeDRs8ybgMRgq9LdvVWXBkMCesNknRscI6WXzgQkY6plogVlV/bKdc5tx2
 5yFdSIweoDtrI4UZs6ZsNHMqbjaIbkKsphDZl71mHF7jgsoQROWWqOKzIzCPMg4JXUUXAiWD3kw
 G+zrxy2e3Mpm8nzIVUgMFaqGS3R396cJqoMklbmQFjYuD8TQsufcT3sSSdSSVkz5uC9JWXZtmF+
 2p4XdOo4lxYLKS0ojZKHFxiZajnBT1jYvytLQinDEY48TfuLIqddKc3tpv+NWHu4pqJB2wk9BKO
 26/HchZZZwvzRuxsweQ==
X-Proofpoint-ORIG-GUID: OZEuh-NkG9L-Kcw6m_poXYSLIGVdel99
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_230334_306583_47946968 
X-CRM114-Status: GOOD (  15.33  )
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

On Sun, Jun 7, 2026 at 9:03=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> On 5/25/2026 4:09 AM, Tamizh Chelvam Raja wrote:
> ...
> > @@ -999,6 +1007,11 @@ static void ath12k_wifi7_mac_op_tx(struct ieee802=
11_hw *hw,
> >                       skb_cb->vif =3D vif;
> >                       skb_cb->ar =3D tmp_ar;
> >
> > +                     if (ahsta && ahsta->enable_4addr)
> > +                             arsta =3D rcu_dereference(ahsta->link[lin=
k_id]);
> > +                     else
> > +                             arsta =3D NULL;
> > +
> Tamizh, please check the smatch warning at:
> https://lore.kernel.org/oe-kbuild/202606051125.XaYVDQZf-lkp@intel.com/
>
> This looks legitimate since there is a path where link_id can be 15, exce=
eding
> the ahsta->link[] array.
>
The function has the below check at line 925 in the same function,
before the execution reaches line 979
/* handle only for MLO case, use deflink for non MLO case */
        if (ieee80211_vif_is_mld(vif)) {
                link_id =3D ath12k_mac_get_tx_link(sta, vif, link_id,
skb, info_flags);
                if (link_id >=3D IEEE80211_MLD_MAX_NUM_LINKS) {
                        ieee80211_free_txskb(hw, skb);
                        return;
                }
        }

In this link_id has already been validated
- MLO path: explicitly checked link_id >=3D IEEE80211_MLD_MAX_NUM_LINKS
and returned early.
- Non-MLO path: link_id is set to 0 or a known-safe constant.

> /jeff

Tamizh.

