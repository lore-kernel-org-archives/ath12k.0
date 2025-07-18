Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9148C83F1A
	for <ath12k@archiver.kernel.org>; Fri, 18 Jul 2025 14:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zyq4Rp8MOZR1xUO79/KSeqlBWH+OdAsga8pf0MgHcCE=; b=3NzcDDa2JrlQCWmAtv4PXSh/46
	vNqknPzKProh7jiixKEAp7Dj2gzseRt/ou+NLsKYIHljuXRMXPZkzZWkLT3Jx26n2SRg1makXkPoZ
	ENoNLc4fG17aMGUHatLE4MQojRwUmu6Oob3+yz3/cmMWYyeakxEonzVdsOhzEql+9pDeAtTQDMPhA
	ca8MD71eVsppjC81psjy9tufTpC8xcGRwYTPrUShz1F2OPkyeqza2oaCh0Xx38Svald9XKifjgVTF
	ORWIw4gmdjwXgDdmLC7RuXvvR0x58USDLaCkR2ZEWwHoob5REPzFT04Ne+XViL9ss90T7d1shymyq
	B7qs/Sxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclkN-0000000ClWw-2yMq;
	Fri, 18 Jul 2025 14:07:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucliY-0000000ClL5-1Fii
	for ath12k@lists.infradead.org;
	Fri, 18 Jul 2025 14:05:43 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8JMP6025190
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 14:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zyq4Rp8MOZR1xUO79/KSeqlBWH+OdAsga8pf0MgHcCE=; b=QxBhxMdKYH6lcQh5
	9hUs87g7JS2E9s+/MN8hC5D/YfjH3V6rZDN6RR9FnOYBN0xb3pcwBhplrJbF3oC9
	ehNb9SgrB+w9yKM3qrWR1k79euMWD+xuDBk1oeZHVRK7yYrSMtl1bv+dCYRtrMOX
	LU5Nd0H7tmpeDOlS/y6H3F16jG1Pq4ponW7BBO6F6k1gddr61BqAZjxwz1np0tjA
	exSDTE/961+DI4cVNrTu1mqRGOqg0VBuUFl752yAVsOOT0XZmPT0gnGOoBxm9na/
	2loD1/jWtogUSrrtbSzB+EqFz74u5aNBCngU2Tgzcy2JdIPVEuRmQVDTB/LxRHQl
	GIiyEA==
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsqg0c2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 14:05:41 +0000 (GMT)
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-87b89891d5dso324732939f.0
        for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 07:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752847540; x=1753452340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zyq4Rp8MOZR1xUO79/KSeqlBWH+OdAsga8pf0MgHcCE=;
        b=Hh9Xna99vpjKQwm9RszwU8LklpyaAYkSobpJZ8Jqoz9O2atb93BPSbYbJusnx/IRki
         apzHWLadvCNr+08KxFEsJI9NpN+/0fAoJT5A5OSv5b8EKsQYuRb4fmG1RAiwVMAPkoGy
         vDCBgHu+U0m/s6OAl2w3a+N2eHLRbS1sChic4+LuYSEpGd1x1CDRyz1IZpE7Va2jihuh
         rKt8VQxR6IaikGyLre2/A6hJ8B+Tnoqg1+l2xAxuTMwOpBNEZFR3IBQ1nPjQHZzvn6Dg
         j8tShhYtWbOaogfKzyQIi5Qnf8msANJEuY4wBz5HuH0Uxw8qlBERudxjDFOXXbqZL8gY
         C8Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWhs5fx9BMvFyNN5hW8LQOw1TlQvrAiNWfOsEqsNo1ftNjm7ujAuF88v0+IEVtzLqIiRaOPAmc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzEsl75OmCg7r5IOjoK11owGXyq9N7DqJ/fRhdrKK1dVQReVKyb
	gGkRWHZrxSgjsI9TWPeC0NUilpgux3oW6F41kbgmS1Ng/G3jGYzX3BRE2JgQ/SrJ/5/wK1wk9Ac
	kzl/qfp9kD+VikVYvL1/QJzlSPYbAROecuKrFud18B+SBRH7GxLUDXM8DhHojXjtlODjUmP6+9l
	anhWwk1jfRyUOTEXP9La46G8sJIVeglpmUeyo/yUo=
X-Gm-Gg: ASbGnctpaDA7QKdUS+9USglRCKq0XYced74DcdVPi0HbbA5KbXfN/yW79HCZz+2St76
	Y01WJxj3rEoAjH/GK/SP52GeDkl0p9aKIZAn3g/UdJIPkD6n1BSm+z7W+bOqDve8r+yoM/QhykY
	4xcokpSKMz2D0ucChjk8c8+A==
X-Received: by 2002:a05:6e02:3981:b0:3df:5309:e962 with SMTP id e9e14a558f8ab-3e282485392mr125888795ab.19.1752847540028;
        Fri, 18 Jul 2025 07:05:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDBjf/hyYGNpctV3HuOKDAPCV8KQACEaP6/w9zosmIlpfDEwcddo1LgpYxZfWgabOw/WiBaSq3a/Sq0j4X5/I=
X-Received: by 2002:a05:6e02:3981:b0:3df:5309:e962 with SMTP id
 e9e14a558f8ab-3e282485392mr125888505ab.19.1752847539496; Fri, 18 Jul 2025
 07:05:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250718025513.32982-1-nithyanantham.paramasivam@oss.qualcomm.com>
 <20250718025513.32982-3-nithyanantham.paramasivam@oss.qualcomm.com>
 <1ae4000edd954cf492e95bdb059c89b2@realtek.com> <CAD1Z1JK1wnCTeObYAHALkxDVFm0kx=7r4urtA4S0XorLNOPKfg@mail.gmail.com>
 <7859082aeea642e2a3fa3a2829404b55@realtek.com> <CAD1Z1J+M2342-fsyc--MB+K4cd16v-csMKd38Vjm4FSdvatEnQ@mail.gmail.com>
 <429a1fbc-dd2f-4c9b-b8da-73cee76e6732@oss.qualcomm.com>
In-Reply-To: <429a1fbc-dd2f-4c9b-b8da-73cee76e6732@oss.qualcomm.com>
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 19:35:26 +0530
X-Gm-Features: Ac12FXzYvmrXYQpDYnGfSjgnISwRZX6ZUSyJWa8g4lZokl2wGknXr63MC9Jz8G4
Message-ID: <CAD1Z1JKSMqRRMKXEL2RUA2AKdP_FyExZ6U8XAz60aXB=B7iVhA@mail.gmail.com>
Subject: Re: [PATCH ath-next v2 2/3] wifi: ath12k: Fix TX status reporting to
 mac80211 when offload is enabled
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=687a54b5 cx=c_pps
 a=7F85Ct0dzgNClt63SJIU8Q==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=n9Sqmae0AAAA:8 a=s4K1LNoi-mhgWz5-MRgA:9 a=QEXdDO2ut3YA:10
 a=LKR0efx6xuerLj5D82wC:22 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-ORIG-GUID: 72TIQOaJr6oh4zIzYaIybo22nolZyWaW
X-Proofpoint-GUID: 72TIQOaJr6oh4zIzYaIybo22nolZyWaW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEwOCBTYWx0ZWRfX+A9PqorpmD4Z
 nxiXeS5ynggpCiJMRyhH85qdImwebe0jt/Kz78LdMY4g/P0jWSARlecyzT3GUrZGrowagJWncKf
 P43mgp93lzuPS3GZ1BNro3caEbsYnxqLlRI1RH8CXNL7earNV2z4rcIfc4Pn0tRX1qOk7ORjiMq
 LiOsnxQ3EUFVbZMbcwHmWQkDI1H1LHzIUUPDQqcSSzCeavdTO3vEFVjQbDMw1+e6Ok68lNJAuiz
 lB/+FNOF9Zhqh+nblZ+4DW7V61FmPMqZqTCv6AHDiGNKnM7wfsvjLaFIITYmqeKTZfuZ0XKitsr
 yBtUMlzdLdj8ATLIxtepjB30lDzVVtNMdBmrM7alhk60+8Yw6BOPNgsAp3OtbLgNeG7zEAoAqL4
 PF6b4NeL7eaT9nbN9GdYJUtSSy/pIwXXWWwIz8auMF0Av6y+KiQnnsvNaewOOpuGBPfia1jy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=944 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_070542_455936_9B4308AC 
X-CRM114-Status: GOOD (  20.65  )
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

On Fri, Jul 18, 2025 at 7:25=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> On 7/18/2025 6:47 AM, Nithyanantham Paramasivam wrote:
> > On Fri, Jul 18, 2025 at 7:01=E2=80=AFPM Ping-Ke Shih <pkshih@realtek.co=
m> wrote:
> >>
> >>
> >> Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>=
 wrote:
> >>> On Fri, Jul 18, 2025 at 2:45=E2=80=AFPM Ping-Ke Shih <pkshih@realtek.=
com> wrote:
> >>>>
> >>>>> @@ -578,6 +579,8 @@ ath12k_dp_tx_htt_tx_complete_buf(struct ath12k_=
base *ab,
> >>>>>         struct ath12k *ar;
> >>>>>         struct sk_buff *msdu =3D desc_params->skb;
> >>>>>         s32 noise_floor;
> >>>>> +       struct ieee80211_tx_status status =3D { 0 };
> >>>>
> >>>> With '=3D {}', no matter how the struct changes, you don't need to c=
hange the
> >>>> code accordingly.
> >>>>
> >>>
> >>> Both =3D{} and =3D {0} achieve the same result, right?
> >>
> >> Yes.
> >>
> >> However, in some cases, it might cause compiler error. But I forgot th=
e cases,
> >> even I can't reproduce the error now. Sorry for the noise.
> >>
> > No worries at all. If you happen to recall the scenario later, I=E2=80=
=99d be
> > curious to know. For now, since we have been following the same style,
> > we'll continue with it.
> >
>
> {} is preferable to { 0 } since the 2nd one causes a compilation failure =
if
> the first member of the struct is not a scalar

Thanks for the clarification! I=E2=80=99ll follow the same approach going
forward. I=E2=80=99ll make the change and update the code accordingly.

