Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281D3D4A5EB
	for <ath12k@archiver.kernel.org>; Fri, 16 Jan 2026 01:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+evrhVA9SDMLmwpBfRxsdGyCMpIj02aFaDnB+4kVeY4=; b=SPLrsLqd0sQ3T6Q8WEfhUXCAlS
	a+abaPot9YOi3Jsue+/zukzX3Iwsa+6WKGmQFPaaIlYKDcDLLPkO+3N/HqvxepQjuP+bw9uJTND6B
	VrXA0Vw43z0K7ccFWm3LPKsWjklfKIFfiq4aFmXfVrtrDR0KbW8O2LPEeeOtq6P5CoyKwaxaQyvic
	OGcrwnPJu5w58bvwcem+IWa6DjZ/8X1f8l8EN3J24yfcIFN1buep0HALVm1CpChiMlsa49VQVNFVh
	8LBo2xofUqgaamC8WPZRpXcFLqRtG0swQ6jJBkT9JZrJKW9f/Hwn+ZcAWP8YiPmhzhtC8/QGOYZPS
	As2EJMRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYcJ-0000000DQ4J-2Hob;
	Fri, 16 Jan 2026 01:27:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYcG-0000000DQ1l-30QS
	for ath12k@bombadil.infradead.org;
	Fri, 16 Jan 2026 01:27:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+evrhVA9SDMLmwpBfRxsdGyCMpIj02aFaDnB+4kVeY4=; b=HE50pRI/9xeJAN9K19324kEnQm
	zYhQuj3OygsZs74ncg/lGDMgLacj5nCA5CaPYsWcMmf2dEq66cVEDEEMix8azkbnQDXABjS5EcK+P
	RQVyLCfNRKGIQ21JXZhdJgMVvV80eAinoRxu17dEG4mM3Mshi1/Xt9+Acld6coFudAjLnXnDROMbb
	brte7pIkCyRqflZWAkF3/GJbq14nsmMHU09ICxb1qgXfedDl76TPipVvJZhUZMGmBJ+g/Uqyi18B8
	lo/ZWkMphoMCtA8198LjkUsqzNNpEfLDFhsIvN629aKnT0/OrvsVtwPPiyw6Fp4gJUYpsW0KpLrm4
	8B4S5edA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYc7-00000007tYm-3FXn
	for ath12k@lists.infradead.org;
	Fri, 16 Jan 2026 01:27:07 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMaPr03192399
	for <ath12k@lists.infradead.org>; Fri, 16 Jan 2026 01:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+evrhVA9SDMLmwpBfRxsdGyCMpIj02aFaDnB+4kVeY4=; b=XQ3bBfWipwgjqIGH
	0NkbCQg4XNggUzxt+FoQWZ57NQIHCuUGcJhO/8sUkPaXhzNtvLZWYk47qOj8Zebh
	7td6mr6RHu4CdFm94XsrSoJzTwH25k6QNQ6q4JDrkLE0ey1H79l4exE77EQRIP39
	8B1iz4MA2dF1U8dOfNRk+/xmNSHEQtlpBTOdz+KuM5xTD/QJO2CBZobJqn99gEC5
	83nMQB3O+EYAh6Mn5bfGq36IkVeMusG//CPIGQAMraQ+T5hqGG7FjUrI+FXa+Rgd
	DAKGellZGVNo0Uo/LekMtfhb3th3W7UlZFJvuKo8EaeKMBC7DGU6co6nyela4OQh
	TiD9aA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq968gbw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Jan 2026 01:26:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b6b9c1249fso209293eec.1
        for <ath12k@lists.infradead.org>; Thu, 15 Jan 2026 17:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768526817; x=1769131617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+evrhVA9SDMLmwpBfRxsdGyCMpIj02aFaDnB+4kVeY4=;
        b=fpmaD0A3lUUsDMH4OnHSG5/rddlIh8rJOESVRtT+kDk5Dt/L6rhPsTGO3RfSSLoBHU
         /+6A2P3ZIbw2RrGwCDVfeaTzwkWVYibWDwxqH5AIS01t3fpeS4l9++vNipVVRqNpxmrk
         4SVhZXdwsEPUHC0YJL/chfCP7cZFBQyMp2KI7rF/+37AVMH8Lx1drx6/tOwqqEsSpGrz
         8833be1Me3qZltc9/jEuVF+C6W0wp3Zgw0dmIFT71VAQUpKQeMz0gL9sVutgkWnPg2Km
         tBmHb0t4o52F7V940dIRD6YPnz/1P4Z5JChK0m9N7DMOEOmu1VPsu4HD+iI+PwaRZIpC
         WMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768526817; x=1769131617;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+evrhVA9SDMLmwpBfRxsdGyCMpIj02aFaDnB+4kVeY4=;
        b=s/BOyDuzjMdaEoL3j3ZspIyMpO9hXE8o1O7vCauoQNy2Tb1xCrthTtbXJCQo59jggB
         M7fjHOOav6az2/FOsAIiQzkAOaLXalvIZzg1uhVkod3gn3Q0OLfAT52UzYquHBOKFEB1
         iLEhjQS27+uMGEgpkp+0wscyFHtO2vJH2ctEvhecaqBwFn9Jk7sz7Y9Xca0FMySkuTKj
         1HsXX3NghU6fOhfqGXJ8K6FoKFIejNb+Fu9y3YFbX5xySVwYu78p+imN8Vmn184c9Iaf
         RwspkoIfXO8i5yPB1BS8A2W9XciAuJqZ+1Sc7J6SKxUjI1VnJqMSqqoAGhtJse0xrOLr
         9J6w==
X-Forwarded-Encrypted: i=1; AJvYcCUYSwMNhqQ2cnGsE5ghSk12Jkgex7rK0OciMFiwa6Tg58U59q2pIfTtsD/ogP8gAp9ziI72b68=@lists.infradead.org
X-Gm-Message-State: AOJu0YwacX15viAdWLARe6eyQvO1dLvJ176dBBh3wp8y3Muu2HcFfxc2
	ZBX2ssQ/AJu+fvseLlfdNuSqGljAJriWZjrAFjXzNPufUMbJIIz7TgMPN9Y7zbxZZdgMpJt/9Rq
	b530afQiVePPtK2TGVLSvvHjqlK3N/lVbT6R25YC7FgctthkRP5vRnJNM3K4y9Ywr
X-Gm-Gg: AY/fxX432xKskqbtrX7lZogkWK2PknmaLddsijbUNHQ2aLrPVOY/N/+wzeIyuLpgyj8
	pEqEhFD1XCCmQSiQaPvbqdJ+2+gBO4/Zd2vw8aou74TbWRqrBy4Qk3Fl+zK++jG5TIK3yMzQzJQ
	G0T04SpJ0UOdZvN32YwxH3WQPXLBlzHbRZA3vkLXLOwEcV4ObLIDaG6JsCVGta2I2nawnaBtEO0
	p8JtEbmnz6srvxFD6e4rmOOOYAQobd/5piCRNqTfVSi/1KV8ocRXelT4459EX2p4e9h5k+6HqOA
	txgJaR8dTsg+8opY82PSYaD96befULGPwbjeXlzASz/NKAVafTSs62G2nL4CViOhr7+mT/rB/uD
	O/vB6j3vlyztb3HgONCsEH4g57iNx6XF44ysDGEEg+Ez2V77DPjPlqL+3/6bPoqiO
X-Received: by 2002:a05:7300:372c:b0:2b4:80f0:3bf3 with SMTP id 5a478bee46e88-2b6b46d359dmr1041561eec.1.1768526817474;
        Thu, 15 Jan 2026 17:26:57 -0800 (PST)
X-Received: by 2002:a05:7300:372c:b0:2b4:80f0:3bf3 with SMTP id 5a478bee46e88-2b6b46d359dmr1041537eec.1.1768526816412;
        Thu, 15 Jan 2026 17:26:56 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm884104eec.9.2026.01.15.17.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:26:55 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
References: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2 00/18] wifi: ath12k: add support for
 QCC2072
Message-Id: <176852681535.1143034.7459833525580352635.b4-ty@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 17:26:55 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=JNg2csKb c=1 sm=1 tr=0 ts=696993e2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pnWoMBQVS5ShONBjoI8A:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 9dPy79LpaJt2Lxfg5cNUzU3x5DsGWXQX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDAxMCBTYWx0ZWRfX+ju0ZPN2bTar
 MP6r9H/1pQAtk8lkkMyh8JAVWUyk6D/9jNkXBLNOuW8N4xZHTmecVqrW4R3jxKLvdBHGsuap6Hu
 CenPIDh8/9pLM0ElfSGOievJCViu8K/6+kHZm8aF6LNwK6tDtS9m/aMfnYaIQZxNW8/y/6fWipN
 jQ3cMTyTmNtvEpYa61SD4zA3OW/AzX7DTZcvWI+Zv3xp5fCfvS8S5Pmo9yY3ImXQimoksfM19wL
 p0XK5H37KIcKigcA6PpcfWIhIwH+HeB3FyzR8qVsPschDERHXmiEg0szNgZVYV5zQXe/vL0QCON
 vsVdPccuNX4khTSYkNwfHzQ4G/LHbAyqmkIgW6cKyZhQdt9lgOchfwUDpOp7bBi1BRifJC7kMBC
 onF1VRrCd7DT+IkMc+VKBSqIQTjvqVUzKKnM9ltrRlbJs0YvhJufBOQw264FfNkIvX+LP/nNCpT
 s5DEcQ0MF909YKcs65w==
X-Proofpoint-GUID: 9dPy79LpaJt2Lxfg5cNUzU3x5DsGWXQX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_01,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_012702_681452_80E81E2B 
X-CRM114-Status: GOOD (  15.68  )
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


On Mon, 12 Jan 2026 15:36:20 +0800, Baochen Qiang wrote:
> QCC2072 is a PCI based device that is very much like WCN7850, the major
> difference is that QCC2072 has only one phy hence does not support DBS.
> Due to such similarity, lots of existing WCN7850 code can be leveraged.
> While to handle the difference, separate operation is added, necessary
> configuration is changed.
> 
> Overview:
> - The first 6 patches refactor/fix current code base to prepare for QCC2072
>   support.
> - Patches [7,8/18] add hardware registers and parameters for QCC2072.
> - Patches [9,10/18] add support for new QMI memory type, new firmware
>   download etc, these are specific to QCC2072 hence necessary configs are
>   added to make sure other chips are not affected.
> - Patches [11,12/18] add new callbacks for QCC2072. These callbacks are
>   actually taken from WCN7850, with modifications due to the different
>   HAL descriptors.
> - Patches [13,14/18] add 32 bits variants for QCC2072 REO CMD/status ring
>   handling, as existing 64 bits functions don't work with QCC2072.
> - Patches [15,16/18] contains changes required by QCC2072, but those
>   changes are made common to all chips. They are not expected to cause
>   any regression.
> - Patch [17/18] add QRTR node id register such that QCC2072 can work when
>   firmware-2.bin image is used.
> - The last patch enables QCC2072 support.
> 
> [...]

Applied, thanks!

[01/18] wifi: ath12k: refactor PCI window register access
        commit: 7a6b6386deb71908181adc26c6ddbe9bc6cef169
[02/18] wifi: ath12k: refactor REO CMD ring handling
        commit: 9615a6727e9d836e60dd4c7442bc8c16f0382203
[03/18] wifi: ath12k: refactor REO status ring handling
        commit: 1f165022d5f06a420a2257d7c38e3d19e16ef071
[04/18] wifi: ath12k: fix preferred hardware mode calculation
        commit: 7f852de0003219c431a6f2ffd951fd82a4673660
[05/18] wifi: ath12k: refactor 320 MHz bandwidth support parsing
        commit: 6281d4f4df228b3588eeb3186d97e195fed07d35
[06/18] wifi: ath12k: fix mac phy capability parsing
        commit: b5151c9b6e3a347416a4b4b55fc00195526d8771
[07/18] wifi: ath12k: add hardware registers for QCC2072
        commit: 089e0e746d598b5d305dae366e022dd90e1bd4f2
[08/18] wifi: ath12k: add hardware parameters for QCC2072
        commit: 12048e2c052b1992857fb71a86d13e0e5b65e5da
[09/18] wifi: ath12k: support LPASS_SHARED target memory type
        commit: 68cc3ac88118ee9ab797aadf15dd30a8145b4be7
[10/18] wifi: ath12k: support downloading auxiliary ucode image for QCC2072
        commit: b065ccf4193ed5f0c224b53fc2cb829a0e2b701e
[11/18] wifi: ath12k: add HAL descriptor and ops for QCC2072
        commit: 28badc78142e4750136ae51da474cdc150a8b3ff
[12/18] wifi: ath12k: add hardware ops support for QCC2072
        commit: 023ace9f9232d43137f346d908996a6fee4de70a
[13/18] wifi: ath12k: handle REO CMD ring for QCC2072
        commit: b7ffeb0f62fddc5f21c6ff610d28e08247b6b9b5
[14/18] wifi: ath12k: handle REO status ring for QCC2072
        commit: 37b34a1c545aa2ab94f3ce1aceec3f00d6f8e039
[15/18] wifi: ath12k: limit number of channels per WMI command
        commit: d518b2d601acffdea6d50ff951cb1344a4807976
[16/18] wifi: ath12k: send peer meta data version to firmware
        commit: d6c5d412f60007e23bebc4eba1de2530a7651962
[17/18] wifi: ath12k: fix PCIE_LOCAL_REG_QRTR_NODE_ID definition for QCC2072
        commit: 853deed04be384fde9138e0442630b5bddf2e418
[18/18] wifi: ath12k: enable QCC2072 support
        commit: d8e1f4a193101a72235416f189b01131a57e26e9

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


