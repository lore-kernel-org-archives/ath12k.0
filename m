Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB789C83F1A
	for <ath12k@archiver.kernel.org>; Fri, 18 Jul 2025 14:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbI8J9O2+zxZL8NR2oitBmHDfKTt1IwVAj4U/Nrlyzk=; b=H9JsM9bCX9dPaUWmjvWRLnsFwG
	sLyDtOMa/m/Aj/vvMlnbDalGLZlfpxUX1uwwnf8ipMXtVRIDA0d4RLs0u+ruL02KRuE2xIFDC8WqX
	rZb6VmK51k04HvYI6J3hlth7r8xWe9/i+z4DXTaZt0X92OjT1A539YDXro8EplaN7D7+WwQ/jac3K
	pPNvSslYURPTseZ1uNQI91abAeXESATA8qSFghx4CJffkRMtv+Cwdz+Rfa+/iUo31Dm34/prlr+aC
	lqIKLoVatiB2v1EjP3sK+sutlFhQJHh8xRUQ80XtleoFAiaQrTvo2P5U0HPtgyFiQuA6s1pc3iawA
	dkFP+nuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucld3-0000000CkPA-2iu1;
	Fri, 18 Jul 2025 14:00:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclR0-0000000CjIR-2J91
	for ath12k@lists.infradead.org;
	Fri, 18 Jul 2025 13:47:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8o02F021636
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 13:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tbI8J9O2+zxZL8NR2oitBmHDfKTt1IwVAj4U/Nrlyzk=; b=mVqbaKZ1ipzzY3Jv
	5NMpT38Iyq4biEpM4N0pmaBwUtM/zL+pNYF7oAF+CPruDCPiuMnef+ufs1o90jTc
	nMoZJItAEXUSw4NBHh8KFcICzwvUqOL5gOakpSqax7tg09T6JtQE85JdnIQwVbyn
	+wSl/PHY8jnswteCcI4QPBcrl1CYkFyx0OFKTI1a4zWNz1+ithOozkFDekO1PI4Y
	PYMdraqj9fbUJ7kNQ8325twUiRz6egoqOIHCZxnzVzWsFrBZsMMdVIqG8fKO3zOk
	Qt36LIjXEXrsxBBeMa+T8G+S5rN1nhwpl/6Y5eh9E/FNik9bS57ENfKw8F8HMH7o
	9JNa+g==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8kj2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 13:47:33 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddc5137992so18503575ab.2
        for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 06:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752846452; x=1753451252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbI8J9O2+zxZL8NR2oitBmHDfKTt1IwVAj4U/Nrlyzk=;
        b=q/l1I6DYk6aesVYHeVZsNyCGrnjxyQg9Ml+iFHQgzT6GsZT4KeiJG6izwMGYmg4W6X
         r5z+paq0Yu+6QgnMjNIqqCAetSl+AY3ZdpXF81Fpe0OSPEmKToC8dmACbuCyAK2UDXuU
         mvCxwoKK9J6VO9e8ffkREncQbMi9oK3qUFamcIx9U6Cm0FvNUi17cA4DhH5HiXiMBhDh
         1+0WX6ltEUVkqFwa96hQAz3NSrLr3bKxrQRC1+LwvNka12btKP/lL/6kieVCKdepRso8
         O9JLMPsNYNxTFDi5rL3hXojZQ6wfKBIxeDVqEvlFLuCzANDFi7cwFA9QsAwQaR3S0myd
         W1zA==
X-Gm-Message-State: AOJu0YxtA+8PEVn+nMswZ2gCYgMlgsqsu1zxSIyVQrgS/HLfW5uUvR14
	+OKhDkdGddT+HvzMPHUQsOUjkxDXP2DmOcmj3FvjEA4wGmp5CgmmfPuxsjNLvbAC4xgCjDr3/nW
	JNuHGMoPuyjHRWGZwMGAylKgg4dfJWw0IvRn412qc1Dd0pWQA68XXirdog0Yvcsy3hy6wTTOdvy
	httvobMiPoVaLbe+Lh5NyM/NXOFmxi954nq7hejrXlEuww8IPQAw==
X-Gm-Gg: ASbGnctITiKAz1Dry1nloWAxGgAZxv3ZqJejqR4peAeN/TRjjqHTBQ3dudo+G32SwKv
	n2C/glRJFjAVZEJVPBQNxLIZ62DdQEKGoWyd//cEIquuw4yV8KU0VCTdb5aqAz3cJyNNcYuBmRi
	dHlPRh1iV+9Yiqr/vklU11NA==
X-Received: by 2002:a05:6e02:3045:b0:3e2:9715:df3e with SMTP id e9e14a558f8ab-3e29715dfd6mr32977415ab.18.1752846452111;
        Fri, 18 Jul 2025 06:47:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9bxuew9zb97voGVI4MzPe+RL+B5AtQ3WNBvMb6CeyMPwOseiKljnYhL+hrMygO9s5udjn7YslrryOk8B9I6s=
X-Received: by 2002:a05:6e02:3045:b0:3e2:9715:df3e with SMTP id
 e9e14a558f8ab-3e29715dfd6mr32977105ab.18.1752846451734; Fri, 18 Jul 2025
 06:47:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250718025513.32982-1-nithyanantham.paramasivam@oss.qualcomm.com>
 <20250718025513.32982-3-nithyanantham.paramasivam@oss.qualcomm.com>
 <1ae4000edd954cf492e95bdb059c89b2@realtek.com> <CAD1Z1JK1wnCTeObYAHALkxDVFm0kx=7r4urtA4S0XorLNOPKfg@mail.gmail.com>
 <7859082aeea642e2a3fa3a2829404b55@realtek.com>
In-Reply-To: <7859082aeea642e2a3fa3a2829404b55@realtek.com>
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 19:17:20 +0530
X-Gm-Features: Ac12FXxzO3FU6wVNQeBYlfveatpj4wyfZ3x4hv19i9wYyAGTdHHgNpo9947r-9I
Message-ID: <CAD1Z1J+M2342-fsyc--MB+K4cd16v-csMKd38Vjm4FSdvatEnQ@mail.gmail.com>
Subject: Re: [PATCH ath-next v2 2/3] wifi: ath12k: Fix TX status reporting to
 mac80211 when offload is enabled
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEwNiBTYWx0ZWRfX17joh832qK16
 Ydv1bUie6PRUSTnXXwv/KuBgkcQ4a7L0YhjGSEPdfyoZflXpj6GvBhYo0i577sWaJw2UGXU9YGl
 /GRXIuOnmBdiOs2xiFYMq7IuoYKATxzPoLtVxTr4wl5t1JSSzFJ1Hp2d7RGvtIBBgyAO+fAMOKv
 8YS9K29VNYK6/7JbFK6zrX5w7ydMDgGIpAFcw9haLAIZJbpwFfs0b9MkPkTdL80zxXHOYXk99Aw
 TP3iZuMbs2OMqFiyfsZEJYoipyqjkoILLNqwDUc5r2xbwe54iu+++dkoLSnAt9KsIep1BGckQAk
 D6F6H4hmALEkfl2NLZFF/DgDzF594ioFrQi10YEqM7mlXECtAfrTTPakzuNK877Fko7O/wjWeck
 Rh5ro8cx7jiQuLiMxnJYL9+mbshNip7Lc7UGdXdsP9XT1w384SVLIk84iJADNtDowBonnYkz
X-Proofpoint-ORIG-GUID: 5g05H7Fyr4p3T-uiBm6Ojz_Swuud236k
X-Proofpoint-GUID: 5g05H7Fyr4p3T-uiBm6Ojz_Swuud236k
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=687a5075 cx=c_pps
 a=knIvlqb+BQeIC/0qDTJ88A==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=n9Sqmae0AAAA:8 a=EUspDBNiAAAA:8 a=JM9kfKmArtAwmz2DbJ4A:9 a=QEXdDO2ut3YA:10
 a=8vIIu0IPYQVSORyX1RVL:22 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=926 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_064734_711125_8103F013 
X-CRM114-Status: GOOD (  15.47  )
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

On Fri, Jul 18, 2025 at 7:01=E2=80=AFPM Ping-Ke Shih <pkshih@realtek.com> w=
rote:
>
>
> Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com> wr=
ote:
> > On Fri, Jul 18, 2025 at 2:45=E2=80=AFPM Ping-Ke Shih <pkshih@realtek.co=
m> wrote:
> > >
> > > > @@ -578,6 +579,8 @@ ath12k_dp_tx_htt_tx_complete_buf(struct ath12k_=
base *ab,
> > > >         struct ath12k *ar;
> > > >         struct sk_buff *msdu =3D desc_params->skb;
> > > >         s32 noise_floor;
> > > > +       struct ieee80211_tx_status status =3D { 0 };
> > >
> > > With '=3D {}', no matter how the struct changes, you don't need to ch=
ange the
> > > code accordingly.
> > >
> >
> > Both =3D{} and =3D {0} achieve the same result, right?
>
> Yes.
>
> However, in some cases, it might cause compiler error. But I forgot the c=
ases,
> even I can't reproduce the error now. Sorry for the noise.
>
No worries at all. If you happen to recall the scenario later, I=E2=80=99d =
be
curious to know. For now, since we have been following the same style,
we'll continue with it.

