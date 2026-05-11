Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7272FCD37BE
	for <ath12k@archiver.kernel.org>; Mon, 11 May 2026 15:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRxhJ5mTvCjFZIndOfyaO6dCRCdhiBeWG0xde26mWWI=; b=BwTNfZcm7wBqYM0WKoDy6mvirJ
	YlbaZracwNPReWk7qkAXNlKbFJGLEB3I87Rkd8zbRmsp2BW2TZ05XaXSgQ6jMANapnR2vu6hg4PPw
	ExcvC/ZNpEGccLslwJW5EgscKYyqx1bBedz25mpB6VdSdSeFDsyO8VY7qOSFOg8QjG06BEUGgqfoA
	oBL7w7rcAoF6cb+jvjWgFmNljHC5a4581/GilH/b2rjjEkIlUqtzyHHZlrdOfEdKhCuuZXGyTbxFA
	8YH5AAfx12eysXrArMlRoOjQJHeXPgFVKLLZp2aMad5b8ml7UGoB2BlSAlEsw4dovd8VpcmdAJg+G
	i4WAvCKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSA3-0000000Dzc2-0i0q;
	Mon, 11 May 2026 15:03:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSA0-0000000Dzac-1Zus
	for ath12k@lists.infradead.org;
	Mon, 11 May 2026 15:03:09 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BElU9s017420
	for <ath12k@lists.infradead.org>; Mon, 11 May 2026 15:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hRxhJ5mTvCjFZIndOfyaO6dCRCdhiBeWG0xde26mWWI=; b=bTKOj4Ng8ISC+D5F
	TNtWN0Ca/5+g/9qeCO6wHZXf6d8B+3ywdFz+dJpNP6zYCaBeb2Di5y0xg49aruxN
	aTeXDYyuIM2EMScvRlkYf8lHQ4OE2umRWEHEYB49oIA8Joo0pNTrTMwLmhcW+Dce
	E8x853nQlAWOsV4lHHpjxwBXX6f13YbCIee9oRhrtW3WZaPhRPZpm5EFbLl0FFzx
	9aZP+Vhxl76ZkF4ztclb/eIZcOwANiVEvOD4Hwk5NH7nTgeqh8j92WIY/FcDdgDD
	WbeERdeeSfnbU6l4eNY/+98CAw27UhdFLHhEP/WF5QbqmyYg+YAjLhym2yA8NzMz
	z6ppNA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xftbfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 11 May 2026 15:03:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso5867693eec.1
        for <ath12k@lists.infradead.org>; Mon, 11 May 2026 08:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778511786; x=1779116586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRxhJ5mTvCjFZIndOfyaO6dCRCdhiBeWG0xde26mWWI=;
        b=YKDvhd+UnF/7hSJwsLBmTu90E2avym0sjILfc7ExNYspWpoRTls15vUmAbTtLMBuUf
         XQOz4nxdesIZCUgY2oQWCVapxAN7/RF1PhKu2iLT2Dpe0Ane95JWBDbPIoJ/cGeMY6s5
         X3y2UWyR/fzxm9qmP5BOGY4NbQXjpRH2/qlbP90VIjbOPyxElrgIjo4QSmavgvrSNas9
         mi9F07G1+aN2I7Y6Sz08iBiLj26+MMgt6RMwBcMCQKhEb8A4agtqG+ayP45C8aVOCKKF
         caggmeCu+vVm5Gps5tDlSbIqWWGfgvqgImyeY50NhU70fEy/scCMdee/Ia+XwqtxDdGZ
         kkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778511786; x=1779116586;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hRxhJ5mTvCjFZIndOfyaO6dCRCdhiBeWG0xde26mWWI=;
        b=fLNKaTqbMIyTHfVmwHtosVo84AinpdjJX/XAykEEV2tprfnyFSdbUjZF6f4VHwupmJ
         hlwg7LmMSwMFaQdjWZtpg102HgiKNdiY+m7C6T3e900pkbqgeNHPd781r2m33KSONNOb
         aeGTT7eIWMpQaI3vdquGzaMUNMm07cUYeMd6wKq8t9uj/RvA0dpJ7tojyf8s6NqAp6tB
         +7AM7POeu9D2kC2oAxk3mY6VDAWRfefdw94kQfkSWhxK93hNO9u031It0/STCoNp+3Z5
         hQD6XuNWK6q1VsE69Wve4D0Syy517adktKqZna+RP4nroW8jqIUaBEX9rUGSC70KaYk2
         yi6g==
X-Gm-Message-State: AOJu0Yw1CiUnRAyhVVwreS0Y/zvyRCGaj3izt2Y2Mr9uSooKd4bSm0BU
	9326xWa1dgOPil7XqAYkJyOenEbvzaQ8dRtKeAcgnATQqUL8Cx9FgakgcwEsgNuSVxHB+2a3V1k
	F60WsQMDFLIaIIqywyw20omHYLQBNpZJ2vcHXSzNKGR2RcoIxGPqQ9ywUVdRWcFmHVufHe67C
X-Gm-Gg: Acq92OFBlAHbx7E/bySbFTYNOf7484KICZcxYgIO1RbMJy++aXkaJ4YwhvHvbxAdS0B
	iwcGo3vRViAadUxUWap5qtyy3V5kVME62sT4qva63Tv23Hb6JFGu17z/KWsO0jSefrfssRTh6K6
	5hEPtInJdxW1naoa6d3KBudPYtIaorEY6cGIn+1eHH4PItKddcwit2/45QAaNkAjo6QyLRSOB9y
	LqjrUr6+queV04bk776rt2DvTscb5RMy+xSCjCDV6V+ki12FHhwauMTO8CC57JsgMDOzx/45rza
	6VNEp6rWwRhwci6YI5FpdYdoGDLIvoWk+GXJjxEEwER/VyW8mROjblOk12OG3maU469gEInQCKK
	MAvwCeZzytBLGSWYm9pV5dMry05xmQ1RTM52eQxR0btD264tDLJK6+cjRkAjKlRddcohNI5DnLg
	xV
X-Received: by 2002:a05:7300:a2ca:b0:2e2:d94d:6175 with SMTP id 5a478bee46e88-2f54dc8ef26mr11350433eec.12.1778511785478;
        Mon, 11 May 2026 08:03:05 -0700 (PDT)
X-Received: by 2002:a05:7300:a2ca:b0:2e2:d94d:6175 with SMTP id 5a478bee46e88-2f54dc8ef26mr11350334eec.12.1778511784591;
        Mon, 11 May 2026 08:03:04 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eafcdsm17330453eec.6.2026.05.11.08.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:03:03 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Yingying Tang <yintang@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, yingying.tang@oss.qualcomm.com
In-Reply-To: <20260415063857.2462256-1-yintang@qti.qualcomm.com>
References: <20260415063857.2462256-1-yintang@qti.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: add channel 177 to the 5 GHz
 channel list
Message-Id: <177851178375.1372190.10510636976243066301.b4-ty@oss.qualcomm.com>
Date: Mon, 11 May 2026 08:03:03 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=TqXWQjXh c=1 sm=1 tr=0 ts=6a01efab cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=dGk-cjk1AREVnTvJvk0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: Hdh5kBCXCnJ3Wwe4zxWvccP2P382-hGC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE2NSBTYWx0ZWRfX9O82Kwuw1ExB
 +y2itHt/opQkDK9RMEdkPsYdfejSRPywFu2Qd5T9ChRPa/uf20gb12JLpvkkDEQgFXmw0iSXYZh
 NSXLoQB6bLlevt59nZ441ytEpXCwozRR1fDyjcbAE3XiX/+OKiBxg6MqOANDV8XM+MT+71/9lmB
 q/OYsQq0JF7fBGmYnl1AzRaOrn/ErrcQaCh+Nm9eOYzjafvYfwF6fSRL4YK7ZvydCtxEHC4HDqz
 9SVFvQjrE/ePxuGGlCP6wnBtROeX0Ekptz0EsSvuDiYWppJB357YZUl6zRC4z7+GSvIvY47E3b9
 nl8v+XxPTAIcOcIs6lThgtqab64evt06uYvbeubW5gWcec6JnC7ANj4n8zKRdRocmBDg7mJFXZ3
 /8xfgQSJQ1ufHJJIsxu+P98hBxVIcnU0YeQBnxWqgL7EPo3SUSDIu1Gp6qwBCZg6KlsPDYrkZFu
 paWTEPoO1Y/Flku26tg==
X-Proofpoint-ORIG-GUID: Hdh5kBCXCnJ3Wwe4zxWvccP2P382-hGC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_04,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_080308_562110_5E1AD388 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
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


On Wed, 15 Apr 2026 12:08:57 +0530, Yingying Tang wrote:
> Add support for 5 GHz channel 177 with a center frequency of 5885 MHz and
> Operating Class 125 per IEEE Std 802.11-2024 Table E-4.
> 
> Channels 169, 173, and 177 are in the 5.9 GHz band and must be disabled
> when 5.9 GHz service bit is not supported. The 5.9 GHz band is only permitted
> for WLAN operation under FCC regulations.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: add channel 177 to the 5 GHz channel list
      commit: 1e8ab2e2e9622d7fa31810a4d7031614e2945f45

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


