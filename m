Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5977CC6B1A
	for <ath12k@archiver.kernel.org>; Wed, 14 Oct 2026 14:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXB1+owYQBBqW88XzzY6K4eceuh+GlN0C86aFl0rv78=; b=bKBD3ED2SRqb2Uv0uZfkj4iqVP
	a501RnuLXbPJZVAVuLGhihxfpG2ei6pk1S57yekx48tAWOwTMswCW9MSbc2NV3qNbToWVUdsGyZJY
	lFGbZMWbvqbrUB9qeudwtwbwDTY33ZHSJQAm1SWAxqPOJ9Xtq8Hfiykt14/oz75BEjvYxLrV5rhNI
	WhhVTKy6QJOyO2z4GR7kapjpHs2LUmi+KDWkyHh+P4CoNLHf8np2QvxXfZyhmOMqQcgDUFVhcUsJp
	NaquS+Z19tpgJOG+dGgmRwav9WnYcTTy8bIY53pCdIH7gV3kn6K9hx1x8mvQElvelRDmd4trV3mLd
	C24gnHZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzbX-0000000Ffwe-1YT1;
	Wed, 14 Oct 2026 14:05:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzbT-0000000Ffw7-0EWC
	for ath12k@lists.infradead.org;
	Wed, 14 Oct 2026 14:05:12 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EAZxiA806688
	for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 14:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DXB1+owYQBBqW88XzzY6K4eceuh+GlN0C86aFl0rv78=; b=H4YyJgJCbnABl9nz
	FmZ7sqPp+0OU5N0uI4WwVsQ6BxuZtcWiYZwgKoCwW9E/5flb+LG/sKBPnUMaNxGb
	7MiUv6vxm7rrJbssZja31V8RfPFlrQZnt4pmlMul6VixjbYUpA0WzmfXSmxssXsH
	GexKlSPHb4hhG/zIxIejefUy3VlURerLDXzfPEfZFE6w+E8ycwFaDDvZSLAq7tVz
	Ph5zbELPlNS8yM7v3qB2/zxDXe08DKhDLq2hCDYVlbcyt4Cx01KAMKto9sft7DEG
	ZNjw1b90zrQdHjUPewyxunuqZJHwgsqSU4Q9iiHBK/BDfDVeL7xKFNUXBM0H/+jz
	QAPAzA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6btj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 14:05:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93dea15d721so48107185a.1
        for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 07:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791986709; x=1792591509; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXB1+owYQBBqW88XzzY6K4eceuh+GlN0C86aFl0rv78=;
        b=QLKyictfdoa0R85E9bE2X2F6L3o78OFHshDIr5niw/PKo+G9FhrmQahLQHDWxYwCEq
         veXO0vncsjS1wuyM5xOn9nRFrTaHqXfGvbEMZlNE6Rh2stZ/xsfn6LDdm9TBuK5hlpYQ
         jJGE5Od4b5sSShSQ48I8RhK1TXGyS2wCEbNkIhTVMbOsyAJgB5S9HRaGbjb93fZ1OjRo
         Udewy5bIZ9PGOIpZCesqGiAaEW2sNAJo3BQq2mL2NbMIlbAhyFtRZSSjJOIvdNCyehCD
         Wf/YtGxlR78mokol0ScW4k8kwGdackFmxBs/1vA5ULnByJHTax+j7TltESxmmfSC1GPw
         CAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791986709; x=1792591509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DXB1+owYQBBqW88XzzY6K4eceuh+GlN0C86aFl0rv78=;
        b=idLY5SeNICmdhuUH9kWE0c+I+htrWRrA/GVxg1Wb1U+aWx7FCdoEYlUMfzyOuqJ2re
         y09pv5e98/+6DRHDnDXa9REIZ4E+7kpYJVGvxs7UZzXbFE0tS6eO+uu4txGI0SK2Qay7
         KfMdVVkMQXpCLjOy9ObrSsBRTmJaNzuE0SOLitWhY1SMUSpV25ABzTHmxffexcSlQmfV
         0D9os1DLsQNXi22HTWKla8ytFGYbIPsUi52PCDl7iamx49bxqIgO7OfZdSJG3xVPil8o
         9ULvJ3YVbA9iToHdm35Dch+oLz1tmWeqIDBRHtSGgUXHUGHawNHKe6zUkhZoAZ1ZDWVj
         gQfQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3l4zYd1Vgs/8ldCpW3D5lR7YozWA+2X3idTxTxT5XWzBKPkZ/QSjzqD+fzl/R92Mc5R2y/OQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYJi8SaleXlEnmFMWNpHRZv0uRyLgGQbXRnchG74og1IChRfvQQd
	Jc/mn8VeLOHaaGNjES83nBiI5wJaHy6lYd/x2LN73GrRDaytds558+12+1jG7I3Z7Mn5rQtPf3S
	yGXWp5EbhSOJpRpVEd5+4z61IfgHmH9kENfygPviEvZ/jiy6KA+ku7KeEvsSw0PNO
X-Gm-Gg: AYBFou1HuZxyeloDBgT61kxcr1Ade+SmHSPKGiUK20LOAoaKrniEeL30piMckoZOBa6
	4b1VUQVUuKc9pAWzkR5w0fb2FUtCJHXPYgwWxD/4D0WM4NBtEpFZ10QQ77kecd8SiRSyRrFhkOC
	hWZBLIlC10YUfHg5e/+OSLW3R4hVNLkLD4/d1vPsbve6OdZFII/CIO64/T84pHc01LRLxm4fToE
	7p6k5k0E9FM2LKa8oDW4VvZokvLHonV6S62TCBtZCDuO95BKNMNxGurydO6Ph2/pZc7IM/9bAMx
	8rCW3DZuRwgRY6Uh/DfHUHMct1yl1Oc2dFbxkw1+4wS4ms3+Sg/XpWq2sKQKFKp7t2Ybnj2cpnx
	7+GwC6Zh1DY2P2+VB1UsQsA==
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr1775883585a.2.1791986708844;
        Wed, 14 Oct 2026 07:05:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr1775875785a.2.1791986708169;
        Wed, 14 Oct 2026 07:05:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c6805985sm38426281fa.2.2026.10.14.07.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:05:07 -0700 (PDT)
Message-ID: <11f513bf-fdc1-419d-8eb6-5cabb6220fbb@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:05:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/5] arm64: dts: qcom: glymur-crd: Source MAC
 addresses from a UEFI variable
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
 <20261014-b4-nvmem-efivar-v1-5-187c85f65018@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-b4-nvmem-efivar-v1-5-187c85f65018@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fft7JbL1ijo2WA6jO1Jp1KbbNg_EuqWh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfXwDPPzqR0YLs9
 +wI36HQJSZ4OpUas68hdiOPbXyS2ob/LDLJWIQYpwZPx3vfaquBt95EKah5Vrer6c7dFVfMkSP/
 KPbEaE6142Ox5SSY8Ti95PLs1myXMA0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfX+J/IFA9FqHa5
 cM3dV/n3tdh18QYTP6tvEOqbDSCIKX95QH0sFCuuBEl/2hK4Mz2/4HleDaJA1IWDvC0dhwY663R
 XH//PFwWeh17Cgj+mONArDXBUYFEmNWz6KWA2G/QpVcvPQYKEASjssFEq1++xwjE5pkn62RX4zo
 6Xt6OqMm1/u4BhPue38w5ods7gvoMJ09zmSGrPIiVb4yuiwH4N82ZfStfSF8gH7wv7CNOaKH2Nq
 mi8asRSMNyfCGjXWNoB8JKAIgieYwosB/0/BB7N1h1taqj5040NfEAYn23lhoPm+QuYQ5VpigFt
 2c4tvizJA22Wiom97P7e7c2iVJcTNBZEhbsj2Qg1N4G/SiSJENoDw1Tmog6DG/jhQxikUM7blMD
 kyww8oKhGWqcR+r1088unqcD7M6kXHc2cuMnwzLriQ4xajv4ZUQw0/B7d0p25nltWHTei7QSAWh
 ec4MBd53bk9rrPceAcg==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf8c15 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jRqq2JA-ig1rCJpZVWcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: fft7JbL1ijo2WA6jO1Jp1KbbNg_EuqWh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_070511_127701_BA0DD9D6 
X-CRM114-Status: GOOD (  16.26  )
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

On 10/14/26 3:02 PM, Abel Vesa wrote:
> Add an nvmem-efivar provider exposing the "MacAddresses" UEFI variable,
> carrying the Bluetooth BD_ADDR (bytes 0-5) and the WLAN MAC address
> (bytes 6-11), both MSB first. The variable is looked up by name, so no
> vendor GUID needs to be hardcoded.
> 
> Wire the bd-address cell to the Bluetooth controller and the mac-address
> cell to the WLAN endpoint (pci17cb,1107) via the standard nvmem-cells
> binding. Until the variable is provisioned the cells read as zeroes and
> the controllers keep using their default addresses.
> 
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> index 58158b51fe29..2dd09ab1d550 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -31,6 +31,22 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	/* BD_ADDR and WLAN MAC from the "MacAddresses" UEFI variable. */

Let's drop this comment and sort the node

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

