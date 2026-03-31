Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F1BFF60D8
	for <ath12k@archiver.kernel.org>; Tue, 31 Mar 2026 07:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbngtZzUScXtX+wiomttWUO0lBE723z1dakRl/pRrFc=; b=UMUlmi/jeMuH5xvu4H4LTDFNaD
	1/Bot4U8Ni5NtCt0VjWUi6ql7bRNCLCgweEEyXym384ed6UspAEH87248ppuUPjKr63yGA1i3kTPb
	bv9d1Ec5I8L/2HhUSIgk+I9fT4S7dTBoF/IOhooRzZjPAjydBi3TGvXlD91F4prQnp/goL/5O80dk
	Itgnfjeh08QOySPRGnUQWu1zV6Yf9jE/vSmeSiY8EpvT9FSydt+T2BtJmAjjnDnVSdPn7YDyVc1RE
	z4NXlDy1KKcOgYfYRlS7bTS5V8QdNMP3D+eyDWWHrYCgt5qTye5qjz4+a/qVJB85BsHt7ceht/ifD
	NFyROmjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TSt-0000000CTWB-3i43;
	Tue, 31 Mar 2026 07:24:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TSs-0000000CTVt-1iww
	for ath12k@lists.infradead.org;
	Tue, 31 Mar 2026 07:24:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A0BB343E19;
	Tue, 31 Mar 2026 07:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF41DC19423;
	Tue, 31 Mar 2026 07:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774941881;
	bh=ExLT5dd64mgQYApH0Oz1/dJvTFDHMpbk/nH0w412QLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G3bV0QBlSKpp5DLQjV+ZY7JZNiG1UREwa2T7xE+RjyX3t+uCEhAPcAHiCtyCQDOJK
	 1q8qTZwVIKv8mJ02F50d7lt+rPzuOLBf7wZYOpkuL0e9Z7VD9m1EkC3VaTtEP88DeW
	 QsD9+HpTj6b+50IHDidofiXgmI2zoqEVCVuSaWDZKcw2vJlP4KSe6VUxQTlK+fTaDY
	 MAbNbkyDsK8OwKPMzosH+GLaSh+Vf7HUGkvqblNl+dHUkD52IjVp+IBu2oaQTjdjJZ
	 yEjvzBcYiKnXv5hpZ5dZm/mhz1MUrU2JvxaFjjjxOJrmlL9pGd/LKnKjPdkZDw+UjZ
	 7BaAdfvSBczqA==
Date: Tue, 31 Mar 2026 09:24:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ath12k@lists.infradead.org
Subject: Re: [PATCH ath-next v3 1/6] dt-bindings: net: wireless: add ath12k
 wifi device IPQ5424
Message-ID: <20260331-fanatic-elegant-wallaby-913e35@quoll>
References: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
 <20260331-ath12k-ipq5424-v3-1-1455b9cae29c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260331-ath12k-ipq5424-v3-1-1455b9cae29c@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_002442_464769_B84FA621 
X-CRM114-Status: UNSURE (   6.14  )
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

On Tue, Mar 31, 2026 at 02:09:06AM +0530, Raj Kumar Bhagat wrote:
>  $id: http://devicetree.org/schemas/net/wireless/qcom,ipq5332-wifi.yaml#
> @@ -17,6 +17,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,ipq5332-wifi
> +      - qcom,ipq5424-wifi

No, use previous patch.

I am annoyed that you keep making changes even for such trivialities and
require re-review from the community.  Previous patch was correct. This
one doing whatever you want to do in copyrights is too much. You don't
change copyrights just because you wrote one device model.

Best regards,
Krzysztof


