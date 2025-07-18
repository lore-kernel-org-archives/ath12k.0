Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DF8C83F1A
	for <ath12k@archiver.kernel.org>; Fri, 18 Jul 2025 12:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=958/RinuFcl6Ih5iN+hiL5YJlPhwmJUylOw4mZu4SiE=; b=QDdPf+c1ozC+XQ8JIg72XLAtd2
	/44/RI/Y/DMUENxwZ4gDFravnsO/D3DvCAa3DYNHzrHFkHeqv9L61P71tlVB9OuJvpvpbf1N1l2lg
	zupUCsofaHfJ15tyU6LThVYbdnC/GB0DfDX+oS/v0Gsmz1S656PMUnqFSkUgH+vjvTutBHuHlwMOv
	ktFhnBMIEdWpYe82bYoBX/9VfwP8wI4B5nsbopMKq2ICqD9z5xChKSqrUwcm7Fv7i8ng2OzNlIRCO
	ipJAAtkU8H34jX9E8DqlD81OOcyTqsm3b5LegFvE3ZfhXQJEiWhbnrGDG/IIQ3Vlzlbw+F8TyYmKz
	t464jtVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uckgK-0000000Cddu-0Nyy;
	Fri, 18 Jul 2025 12:59:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uckeH-0000000CdLN-4C4L
	for ath12k@lists.infradead.org;
	Fri, 18 Jul 2025 12:57:15 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8aDWS021792
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 12:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	958/RinuFcl6Ih5iN+hiL5YJlPhwmJUylOw4mZu4SiE=; b=QONUvnxl0+5mdRDb
	tvG1m+gCfJRaAwcgqvxpysa/IEYfncZkL2l5oV7MG3pWtlulPJIUxThzI49NPLUA
	8NYLDKsR8uCTv9bLUC4z1JAsGqekKc/pzt/dSXeHb1gIY3dfM5mLE8xjIsgGZvtt
	Hi815JfmiF5tS2o4MT+LsyGIeSC/v9/i8kc3wD162PsccQeOexuEuYq/vfPq7SdZ
	icpjMdYF36ju6kkrKMOHlYHfEmGLGP5vTOsZDm+LJGMI02QiMNginfHGnu7UodSt
	XXGtfEtlt+7DoXkJg6HJ7ZApJsdHTGQTzD1g2WeCqyr2bSPNiORVpBewlwhMuiF3
	b49R4g==
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8kc8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 12:57:12 +0000 (GMT)
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-87595d00ca0so193973439f.2
        for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 05:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752843432; x=1753448232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=958/RinuFcl6Ih5iN+hiL5YJlPhwmJUylOw4mZu4SiE=;
        b=AmxyIABSdyvn0LGkz88flJR0L3BpuVNegYMWnw9nNdSHzAyPQLZ/l3ZTEDiMwuFytV
         GBxKEckN8OYywZDTEmkWo5QXe0egSxxxTq3DEbf6fei8ZSnG4RPiEckIpcEFH5gjyQe+
         PRpJKEYivt884jYkq2X05j1MW1XJGwyu0YZ3oTl60VwVGCG/zFGdKAtOdGzNH7e4WFGq
         3+nRjendxqwBVc3YSnYrnYBKZAyK/CVdcVjb815hKdhjjzAk0+fqVcXRqYo62BsU0NUX
         HrAHQIfetB+XOMd6/BeIUEuxD46q/c8dK6NqQ21bTfrxFY9t1aQBnw/Qfa/DJXI0ELl4
         JC7Q==
X-Gm-Message-State: AOJu0YyIwDicoENXYJvizU7Vawq/FRxz2DNqq+GXWxFImz7+R9OPu/UO
	v1+YOOUtpCmzxM4JJVa4m4QSvqx+xWKqfqr66tOKsNeFEn8OKpaFx44UdMPKWuIYB41+ozbr1go
	lpW94d6fOdhRx5Z/D7KA8j3s8TSGvNO+0UlHIfVLfXfKsOv/aM4rtqvymITfX4L6SWFGjOq9YvD
	Q8+lgFNno07W+4QQqswIR6gYCFsXIeWsqqGfQ1jKU=
X-Gm-Gg: ASbGncv0JOOJSHzsnGIW/EMmcTVHN5JPreFpifS3AcFTeGJmxr3Bp6cW3QdcqpEcbUm
	6S891qX+l7BZNhi6u6NE3764XAm6KODWJHIixWLvB5f8iNBkokjOyKvpQ8N1VkZbWCFtIMr37YL
	9yaPfAMYxAji0HGxWz1dmUgw==
X-Received: by 2002:a6b:5110:0:b0:87c:bf5:c242 with SMTP id ca18e2360f4ac-87c0bf5c480mr322168239f.3.1752843431772;
        Fri, 18 Jul 2025 05:57:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXjBAut55aMcXApNG4TXougkXbkFdUFxCa9fi0cw8T0llYEk9LYmRpcxB//1U2UmmX5Fa41z8ZEZcnS9XiIEY=
X-Received: by 2002:a6b:5110:0:b0:87c:bf5:c242 with SMTP id
 ca18e2360f4ac-87c0bf5c480mr322166439f.3.1752843431339; Fri, 18 Jul 2025
 05:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250718025513.32982-1-nithyanantham.paramasivam@oss.qualcomm.com>
 <20250718025513.32982-3-nithyanantham.paramasivam@oss.qualcomm.com> <1ae4000edd954cf492e95bdb059c89b2@realtek.com>
In-Reply-To: <1ae4000edd954cf492e95bdb059c89b2@realtek.com>
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 18:26:59 +0530
X-Gm-Features: Ac12FXzj0DPu3TurVc7e4btFCp14YjPiNSUwWHpykNU-GLFU43LlmfUBl8e7Bvc
Message-ID: <CAD1Z1JK1wnCTeObYAHALkxDVFm0kx=7r4urtA4S0XorLNOPKfg@mail.gmail.com>
Subject: Re: [PATCH ath-next v2 2/3] wifi: ath12k: Fix TX status reporting to
 mac80211 when offload is enabled
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA5OSBTYWx0ZWRfX/lKaXFqE1cL0
 lWBqdEMv96kmQIykXde2wbKxa/+jesHOFtd1lmZ+Y5tG2l06UFwu1QnjhkbaDZ1cERfcixc/LVW
 eKuiS87cOwb2dUVNR4WQ/vNogDuVlXoQhscyKSRgNGU+uqaRtOZ+gSzez68ZrqBFBBOutZn/RfF
 Z+RvijYTooyU8xv82XZxTfK7q4Xc+d92mJMruykDrhcVyvzNSJR6EC0i2Tm7ULONIfNMsbEUoDB
 MVnbEDmsWwaGMA9003wgbFCekwHVBBX0Fi6TKXHf+5Zk8epsSdWIX4kcI0SIVXlstcFIjxHirQf
 0P4T4nZPsdvNkrS1KsX6nurKIre3MlQ4zt4NiAk2+pslcnejIvWdePdzvPu05yvbQZcpKpBDWyE
 yBGOpB7vQvUvwCQC4+4T6nKcG9ogBa12XS5ekGZ1PvxKCs9mULNulLA623EMFb5LWzmscryE
X-Proofpoint-ORIG-GUID: 0yWI5twmfLtFxCzjkpBzPPSAx3J9PyxU
X-Proofpoint-GUID: 0yWI5twmfLtFxCzjkpBzPPSAx3J9PyxU
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=687a44a8 cx=c_pps
 a=WjJghted8nQMc6PJgwfwjA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=n9Sqmae0AAAA:8 a=EVJh1RV3RwhRAVzL0QcA:9 a=QEXdDO2ut3YA:10
 a=CtjknkDrmJZAHT7xvMyn:22 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_055714_157915_06B3658F 
X-CRM114-Status: GOOD (  12.61  )
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

On Fri, Jul 18, 2025 at 2:45=E2=80=AFPM Ping-Ke Shih <pkshih@realtek.com> w=
rote:
>
> > @@ -578,6 +579,8 @@ ath12k_dp_tx_htt_tx_complete_buf(struct ath12k_base=
 *ab,
> >         struct ath12k *ar;
> >         struct sk_buff *msdu =3D desc_params->skb;
> >         s32 noise_floor;
> > +       struct ieee80211_tx_status status =3D { 0 };
>
> With '=3D {}', no matter how the struct changes, you don't need to change=
 the
> code accordingly.
>

Both =3D{} and =3D {0} achieve the same result, right?

> > +       struct ath12k_peer *peer;
> >
> >         skb_cb =3D ATH12K_SKB_CB(msdu);
> >         info =3D IEEE80211_SKB_CB(msdu);
>
> [...]
>
> > @@ -805,6 +830,12 @@ static void ath12k_dp_tx_complete_msdu(struct ath1=
2k *ar,
> >         struct ath12k_vif *ahvif;
> >         struct sk_buff *msdu =3D desc_params->skb;
> >         s32 noise_floor;
> > +       struct ieee80211_tx_status status =3D { 0 };
> > +       struct ieee80211_rate_status status_rate =3D { 0 };
>
> ditto.
>
> > +       struct ath12k_peer *peer;
> > +       struct ath12k_link_sta *arsta;
> > +       struct ath12k_sta *ahsta;
> > +       struct rate_info rate;
> >
> >         if (WARN_ON_ONCE(ts->buf_rel_source !=3D HAL_WBM_REL_SRC_MODULE=
_TQM)) {
> >                 /* Must not happen */
>
>
>

